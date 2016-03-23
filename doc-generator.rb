#! /usr/bin/env ruby

require 'rubygems'
require 'json'
require 'erb'

#Use UTF-8 in any env
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

$:.unshift File.join(File.dirname(__FILE__), 'src')

require 'language'
require 'table_helpers'
Language.send(:include, TableHelpers)

class Generator
  INCLUDE_DIR = 'include'

  def initialize
    @config = {}
    @pwd = File.dirname(__FILE__)
    parse
  end

  def checkArguments
    if ARGV.size != 1
      puts "Usage: ./doc-generator /path/to/config.json"
      exit 1
    end
    @pwd = File.dirname(ARGV[0])
  end

  def checkConfigLanguages
    @config["languages"].each do |languageName, languageData|
      if languageName.nil?
        puts "Error: a language does not have a name"
        exit 2
      end
      languageData["outputDir"] = File.join(@pwd, INCLUDE_DIR, languageData["outputDir"])
      if !File.directory?(languageData["outputDir"])
        puts "Error: \"#{languageData["outputDir"]}\" is not a directory"
        exit 2
      end
      languageData["referenceLanguage"] = File.join(@pwd, INCLUDE_DIR, languageName)
      if !File.directory?(languageData["referenceLanguage"])
        puts "Error: \"#{languageData["referenceLanguage"]}\" is not a directory"
        exit 2
      end
    end
  end

  def checkConfig
    checkConfigLanguages
  end

  def parse
    checkArguments
    configContent = File.read(ARGV[0])
    @config = JSON.parse(configContent)
    checkConfig
  end

  def generate
    @config["templateFiles"].each do |templateFileIn|
      templateData = File.read(File.join @pwd, INCLUDE_DIR, templateFileIn)
      @config["languages"].each do |languageName, languageData|
        lang = Language.new(languageName, languageData)
        template = ERB.new(templateData, 0, '-')
        fileOut = File.join(lang.outputDir, File.basename(templateFileIn))
        File.write(fileOut, template.result(lang.get_binding))
      end
    end
  end

end

gen = Generator.new
gen.generate
