# wsgi协议
关于wsgi协议就不赘述了，以下是最简单的符合wsgi的应用
```
def application(environ,star_response):
    star_response('200 OK',[('Content-Type','text/html')])
    return 'hello xy'

from wsgiref.simple_server import make_server
server = make_server('',8002,application)
server.serve_forever()
```
# app attriabute
```
class Flask:
    def __init__(self, package_name):

        self.package_name = package_name
        self.root_path = _get_package_path(self.package_name)

        self.view_functions = {}
        self.error_handlers = {}
        self.before_request_funcs = []
        self.after_request_funcs = []
        self.url_map = Map()
```

# app.run
函数栈调用如下：
```
app.run()
    run_simple()
        make_server()
            srv.serve_forever()
```

# request handler

```
werkzug.serving.run_wsgi()
    execute()
        application_iter = app(environ, start_response)
            __call__()
            self.wsgi_app(environ, start_response)

                ctx = self.request_context(environ)
                ctx.push()
                response = self.full_dispatch_request()
                return response(environ, start_response)
```

# full_dispatch_request
```
preprocess_request
dispatch_request
finalize_request

```

# dispatch_request
```
def dispatch_request(self):
    """Does the request dispatching.  Matches the URL and returns the
    return value of the view or error handler.  This does not have to
    be a response object.  In order to convert the return value to a
    proper response object, call :func:`make_response`.
    """

    req = _request_ctx_stack.top.request
    if req.routing_exception is not None:
        self.raise_routing_exception(req)
    rule = req.url_rule

    # dispatch to the handler for that endpoint
    return self.view_functions[rule.endpoint](**req.view_args)
```

