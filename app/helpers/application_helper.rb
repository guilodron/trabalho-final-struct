module ApplicationHelper

    include Pagy::Frontend

    def movie_genres
        %w[Terror Comédia Ação Drama]
    end
end

