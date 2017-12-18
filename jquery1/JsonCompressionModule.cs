﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.IO.Compression;
using System.Globalization;
namespace jquery1
{
    public class JsonCompressionModule : IHttpModule
    {
         public void JsonCompressionModule1()
    {
    }

    public void Dispose()
    {
    }

    public void Init(HttpApplication app)
    {
        app.PreRequestHandlerExecute += new EventHandler(Compress);
    }

    private void Compress(object sender, EventArgs e)
    {
        HttpApplication app = (HttpApplication)sender;
        HttpRequest request = app.Request;
        HttpResponse response = app.Response;

        //Ajax Web Service request is always starts with application/json
        if (request.ContentType.ToLower(CultureInfo.InvariantCulture).StartsWith("application/json"))
       { 
            //User may be using an older version of IE which does not support compression, so skip those
            if (!((request.Browser.IsBrowser("IE")) && (request.Browser.MajorVersion <= 6)))
            {
                string acceptEncoding = request.Headers["Accept-Encoding"];

                if (!string.IsNullOrEmpty(acceptEncoding))
                {
                    acceptEncoding = acceptEncoding.ToLower(CultureInfo.InvariantCulture);

                    if (acceptEncoding.Contains("gzip"))
                    {
                        response.Filter = new GZipStream(response.Filter, CompressionMode.Compress);
                        response.AddHeader("Content-encoding", "gzip");
                    }
                    else if (acceptEncoding.Contains("deflate"))
                    {
                        response.Filter = new DeflateStream(response.Filter, CompressionMode.Compress);
                        response.AddHeader("Content-encoding", "deflate");
                    }
                }
            }
        }
    }
    }
}