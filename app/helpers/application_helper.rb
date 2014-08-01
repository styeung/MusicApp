module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
    <input type="hidden"
      name="authenticity_token"
      value="#{form_authenticity_token}">
    HTML
  end

  def log_out_form
    <<-HTML.html_safe
    <form action="#{session_url}" method="POST">
      #{ auth_token }
      #{ rest_modifier('delete')}
      <input type="submit" value="Log out">
    </form>
    HTML
  end

  def rest_modifier(modifier)
    <<-HTML.html_safe
    <input type="hidden"
      name="_method"
      value="#{modifier}"
    >
    HTML
  end

  # def ugly_lyrics(lyrics)
  #   new_lyrics = []
  #   lyrics_array = lyrics.split("")
  #
  #   (0...lyrics_array.length).each do |i|
  #     if
  #     new_lyrics << lyrics_array[i]
  #
  # end
end