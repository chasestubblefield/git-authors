class GitAuthors::Config
  def initialize(config_path = nil)
    @config_path = config_path
  end

  private

  def to_hash
    @hash ||= begin
      result = {}
      raw_output.split("\n").each do |line|
        words = line.split(' ')
        keys = words.first.gsub(/^git-authors\./, '').split('.')
        result[keys.first] ||= {}
        result[keys.first][keys.last] = words[1..-1].join(" ")
      end
      result
    end
  end

  def raw_output
    if @config_path
      `git config -f "#{@config_path}" --get-regexp 'git-authors\..*'`
    else
      `git config --get-regexp 'git-authors\..*'`
    end
  end
end
