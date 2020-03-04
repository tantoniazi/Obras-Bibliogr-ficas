require 'test_helper'
require 'json'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test "Buscar dados" do
    get authors_url, as: :json
    assert_response :success
  end

  test "Criar Joao Silva" do
    post authors_url, params: { author: { name: "Joao Silva"} }, as: :json
    parsed_body = ActiveSupport::JSON.decode(response.body)
    puts parsed_body

    assert_response 201
  end

  test "Criar Paulo Coelho" do
    post authors_url, params: { author: { name: "Paulo Coelho"} }, as: :json
    assert_response 201
  end

  test "Criar Celso de Araujo" do
    post authors_url, params: { author: { name: "Celso de Araujo"} }, as: :json
    assert_response 201
  end



  test "deletar autor" do
    assert_difference('Author.count', -1) do
      delete author_url(@author), as: :json
    end

    assert_response 204
  end
end
