class Language
  attr_reader :name
  attr_reader :slug
  attr_reader :referenceLanguage
  attr_reader :outputDir

  def initialize(languageName, languageData)
    @name = languageName
    @slug = if ruby?
      'ruby'
    elsif php?
      'php'
    elsif python?
      'python'
    elsif cmd?
      'shell'
    elsif csharp?
      'csharp'
    elsif java?
      'java'
    elsif android?
      'android'
    elsif objc?
      'objc'
    elsif js?
      'node'
    elsif go?
      'go'
    elsif swift?
      'swift'
    elsif scala?
      'scala'
    else
      nil
    end
    @referenceLanguage = languageData["referenceLanguage"]
    @outputDir = languageData["outputDir"]
  end

  def import(featureFile, languages = [], default = "")
    if languages.empty? || languages.include?(name)
      import_file(featureFile, referenceLanguage)
    else
      default
    end
  end

  def snippet(featureFile, languages = [], default = "")
    import("#{featureFile}.snippet", languages, default)
  end

  def puts(strings, default = "")
    strings[name] || default
  end

  def ruby?
    name == 'Ruby'
  end

  def php?
    name == 'PHP'
  end

  def python?
    name == 'Python'
  end

  def js?
    name == 'JavaScript'
  end

  def cmd?
    name == 'Shell'
  end

  def csharp?
    name == 'C#'
  end

  def java?
    name == 'Java'
  end

  def android?
    name == 'Android'
  end

  def objc?
    name == "Objective-C"
  end

  def go?
    name == "Go"
  end

  def swift?
    name == "Swift"
  end

  def scala?
    name == "Scala"
  end

  # Test if the current language is used on the back-end side.
  def backend?
    cmd? || csharp? || go? || java? || js? || php? || python? || ruby? || scala?
  end

  # Test if the current language is used on the front-end side.
  def frontend?
    android? || js? || objc? || swift?
  end

  def get_binding
    binding
  end

  private
  def import_file(fileName, dir)
    fileName = File.join(dir, fileName)
    content = File.read(fileName)
    content = content.rstrip
  end

end
