module PG
  class CheckConnection
    def initialize(app)
      @app = app
    end

    def call(env)
      begin
        @app.call(env)
      rescue PG::ConnectionBad, PG::Error
        [408, { 'Content-Type' => 'application/json' }, [ '' ]]
      end
    end
  end
end
