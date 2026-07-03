@echo off
chcp 65001 >nul
title 诗云 · 3D诗词宇宙

echo.
echo   ✦ 正在启动诗云服务器...
echo.

start "" http://127.0.0.1:8080/诗云.html

node -e "var http=require('http'),fs=require('fs'),path=require('path');var M={'.html':'text/html','.js':'application/javascript','.wasm':'application/wasm','.tflite':'application/octet-stream','.binarypb':'application/octet-stream','.data':'application/octet-stream'};http.createServer(function(req,res){var p=req.url.split('?')[0];try{p=decodeURIComponent(p)}catch(e){}var f=path.join(process.cwd(),p);var e=path.extname(f);res.setHeader('Content-Type',M[e]||'text/plain');res.setHeader('Access-Control-Allow-Origin','*');try{res.end(fs.readFileSync(f))}catch(e){res.statusCode=404;res.end('Not found: '+f)}}).listen(8080,'127.0.0.1',function(){console.log('诗云已就绪: http://127.0.0.1:8080/诗云.html')})"
