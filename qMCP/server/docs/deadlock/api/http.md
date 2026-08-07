# http

Fluent builder for HTTP requests with method chaining support

```lua
---@class HttpRequestBuilder
---Fluent builder for HTTP requests with method chaining support
HttpRequestBuilder = {}

---Set HTTP method to GET
---@return HttpRequestBuilder
function HttpRequestBuilder:get() end

---Set HTTP method to POST
---@return HttpRequestBuilder
function HttpRequestBuilder:post() end

---Add a single HTTP header
---@param key string Header name
---@param value string Header value
---@return HttpRequestBuilder
function HttpRequestBuilder:header(key, value) end

---Add multiple HTTP headers from a table
---@param headers_table table<string, string> Table of header key-value pairs
---@return HttpRequestBuilder
function HttpRequestBuilder:headers(headers_table) end

---Add Bearer token authorization header
---@param token string Bearer token
---@return HttpRequestBuilder
function HttpRequestBuilder:bearer(token) end

---Set User-Agent header
---@param ua string User agent string
---@return HttpRequestBuilder
function HttpRequestBuilder:user_agent(ua) end

---Add Basic authentication header
---@param username string Username for basic auth
---@param password string Password for basic auth
---@return HttpRequestBuilder
function HttpRequestBuilder:basic_auth(username, password) end

---Add Accept: application/json header
---@return HttpRequestBuilder
function HttpRequestBuilder:accept_json() end

---Set request body as JSON
---@param json_data table Lua table to serialize as JSON
---@return HttpRequestBuilder
function HttpRequestBuilder:json(json_data) end

---Set request body as form data (application/x-www-form-urlencoded)
---@param form_data table<string, string> Form fields as key-value pairs
---@return HttpRequestBuilder
function HttpRequestBuilder:form(form_data) end

---Set raw request body
---@param raw_body string Raw body content
---@return HttpRequestBuilder
function HttpRequestBuilder:body(raw_body) end

---Add query parameters to URL
---@param query_params table<string, string|number> Query parameters as key-value pairs
---@return HttpRequestBuilder
function HttpRequestBuilder:query(query_params) end

---Set request timeout in seconds
---@param seconds integer Timeout in seconds
---@return HttpRequestBuilder
function HttpRequestBuilder:timeout(seconds) end

---Set connection timeout in seconds
---@param seconds integer Connection timeout in seconds
---@return HttpRequestBuilder
function HttpRequestBuilder:connect_timeout(seconds) end

---Set TLS certificate pinning
---@param pin string TLS pin hash
---@return HttpRequestBuilder
function HttpRequestBuilder:tls_pin(pin) end

---Control certificate revocation checking
---@param no_revoke boolean If true, disable revocation checks
---@return HttpRequestBuilder
function HttpRequestBuilder:no_revoke(no_revoke) end

---Add custom parameter to request. 
---Will be passed back in response callback as a 4th argument.
---@param param any Custom parameter value
---@return HttpRequestBuilder
function HttpRequestBuilder:param(param) end

---Send HTTP request with callback for response handling
---@param callback fun(status_code: number, response_body: string, success: boolean, custom_param: any): nil
function HttpRequestBuilder:send(callback) end

---Send HTTP request without waiting for response (fire and forget)
function HttpRequestBuilder:send_and_forget() end

---@class http
http = {}

---Create a new HTTP request builder
---@param url string The URL to make request to
---@return HttpRequestBuilder
function http.request(url) end
```
