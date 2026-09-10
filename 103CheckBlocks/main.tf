  check "website_running" {
    data "http" "example_head" {
      url    = "https://www.googleiuwgr459873.com"
      method = "HEAD"
    }

    assert {
      condition     = data.http.example_head.status_code == 200
      error_message = "Website is experiencing problems! please check"
    }
  }

  resource "local_file" "foo" {
    content  = "foo!"
    filename = "${path.module}/foo.bar"
  }