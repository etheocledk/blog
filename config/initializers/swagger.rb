Swagger::Docs::Config.register_apis({
  "v1" => {
    api_version: "v1",
    base_path: "http://localhost:3000",
    controller_base_path: "",
    api_file_path: "public/apidocs",
    clean_directory: true,
    attributes: {
      info: {
        title: "My API",
        description: "My API Documentation",
        contact: "support@myapi.com"
      }
    }
  }
})
