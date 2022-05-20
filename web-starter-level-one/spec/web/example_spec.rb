RSpec.describe "Example Requests" do
  describe "GET /example" do
    it "responds with an example text" do
      get '/example'
      expect(last_response.body).to eq "This is an example response.\n"
    end
  end

  describe "POST /example" do
    it "responds with an example text" do
      post '/example', 'hello=world&happy=days'
      expect(last_response.body).to eq(
        "Thanks for the POST request to /example.\n\n" +
        "Your params were:\n{\"hello\"=>\"world\", \"happy\"=>\"days\"}\n\n" +
        "Try changing the request and see what happens.\n"
      )
    end
  end

  describe "PATCH /example" do
    it "responds with an example text" do
      patch '/example/99', 'hello=world&happy=days'
      expect(last_response.body).to eq(
        "Thanks for the PATCH request to /example/99.\n\n" +
        "Your params were:\n{\"hello\"=>\"world\", \"happy\"=>\"days\", \"id\"=>\"99\"}\n\n" +
        "See how the `:id` in the URL got into that list?\n" +
        "Try changing the request and see what happens.\n"
      )
    end
  end

  describe "DELETE /example" do
    it "responds with an example text" do
      delete '/example/99'
      expect(last_response.body).to eq(
        "Thanks for the DELETE request to /example/99.\n\n" +
        "Your params were:\n{\"id\"=>\"99\"}\n\n" +
        "Try changing the request and see what happens.\n"
      )
    end
  end
end
