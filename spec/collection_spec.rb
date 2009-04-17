require File.dirname(__FILE__) + '/spec_helper.rb'

require 'tempfile'
require 'fileutils'

# Time to add your specs!
# http://rspec.info/

COLLECTION_XML  = 'spec/samples/Collection.xml'
COLLECTION_YAML = 'spec/samples/Collection.yaml'

describe "Collection" do

  before(:all) do
    File.mkdirs(TMPDIR)
    puts "\nCollection Specs"
  end

  it 'should build Collection.yaml when Collection.yaml does not exist' do
    File.delete(COLLECTION_YAML) if File.exist?(COLLECTION_YAML)
    collection = Collection.new(COLLECTION_XML)
    File.exist?(COLLECTION_YAML).should be_true
  end

  it 'should build Collection.yaml when Collection.xml is newer than existing Collection.yaml' do
    File.delete(COLLECTION_YAML) if File.exist?(COLLECTION_YAML)
    Collection.new(COLLECTION_XML)
    old_yaml_mtime = File.mtime(COLLECTION_YAML)
    old_xml_mtime = File.mtime(COLLECTION_XML)

    sleep(2)  # make sure there will be a difference between old yaml and new xml
    FileUtils.touch(COLLECTION_XML)
    new_xml_mtime = File.mtime(COLLECTION_XML)

    Collection.new(COLLECTION_XML)
    new_yaml_mtime = File.mtime(COLLECTION_YAML)

    old_yaml_mtime.should < new_yaml_mtime
  end

  it 'should not build Collection.yaml when existing Collection.yaml is newer than Collection.xml' do
    File.delete(COLLECTION_YAML) if File.exist?(COLLECTION_YAML)
    Collection.new(COLLECTION_XML)
    old_yaml_mtime = File.mtime(COLLECTION_YAML)
    sleep(2)

    Collection.new(COLLECTION_XML)
    new_yaml_mtime = File.mtime(COLLECTION_YAML)

    old_yaml_mtime.should == new_yaml_mtime
  end

  it 'should have values in isbn_title_hash' do
    collection = Collection.new(COLLECTION_XML)
    collection.isbn_title_hash.empty?.should be_false
  end

  it 'should have values in title_isbh_hash' do
    collection = Collection.new(COLLECTION_XML)
    collection.title_isbn_hash.empty?.should be_false
  end

  it 'should have values in isbn_dvd_hash' do
    collection = Collection.new(COLLECTION_XML)
    collection.isbn_dvd_hash.empty?.should be_false
  end

  # dynamically create a set of specs for various title pattern generations
  {
    'Extra   Spaces'                             => 'extra spaces',
    '  leading spaces'                           => 'leading spaces',
    'trailing spaces  '                          => 'trailing spaces',
    'multiple : * [] () {} ~!@#$%^; punctuation' => 'multiple punctuation',
    'replace & with and'                         => 'replace and with and',
    'remove [foo] square brackets'               => 'remove square brackets',
    'remove {foo} curly brackets'                => 'remove curly brackets',
    'remove (foo) parens'                        => 'remove parens',
    'remove &amp; html escapes'                  => 'remove html escapes',
    'remove widescreen'                          => 'remove',
    'remove special edition'                     => 'remove',
   }.each do |title, pattern|
    it "should replace '#{title}' with '#{pattern}'" do
      Collection.title_pattern(title).should == pattern
    end
  end

  # dynamically create a set of specs to test title permutations
  [
    'foobar',
    'a foobar',
    'an foobar',
    'the foobar'
  ].each do |title|
    it "should create proper title permutations for '#{title}'" do
      Collection.title_permutations(title).sort.should == ['foobar', 'a foobar', 'an foobar', 'the foobar'].sort
    end
  end

  it 'should use title patterns in title_isbn_hash' do
    collection = Collection.new(COLLECTION_XML)
    buf = []
    collection.title_isbn_hash.each do |title, isbn|
      buf << title unless title == Collection.title_pattern(title)
    end
    puts buf.join("\n") unless buf.empty?
    buf.empty?.should be_true
  end

  it 'should use actual titles in isbn_title_hash' do
    collection = Collection.new(COLLECTION_XML)
    buf = []
    # collection.isbn_title_hash's value is the actual title
    # collection.title_isbn_hash uses the title pattern as the key
    # and returns an array of possible isbns, one of which should
    # match the key from collection.isbn_title_hash
    collection.isbn_title_hash.each do |isbn, actual_title|
      title_pattern = Collection.title_pattern(actual_title)
      isbns = collection.title_isbn_hash[title_pattern]
      buf << actual_title unless isbns.include?(isbn)
    end
    puts buf.join("\n") unless buf.empty?
    buf.empty?.should be_true
  end

end