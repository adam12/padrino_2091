require "pp"

Padrino2091::App.controllers :page do
  get :index, map: '/' do
    print "session: ", session, "\n"
    print "session.id: ", session.id, "\n" # =====> ALWAYS BLANK
    print "session[:a]: ", session[:a], "\n" # =====> ALWAYS BLANK
    session[:a] = 1
    session.pretty_inspect
  end
end
