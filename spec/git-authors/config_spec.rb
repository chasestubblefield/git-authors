require 'spec_helper'

describe GitAuthors::Config do
  let(:config) { GitAuthors::Config.new(gitconfig.path) }
  let(:gitconfig) { Tempfile.open('gitconfig') }

  before :all do
    gitconfig.write <<-END.gsub(/^ {6}/, '')
      [git-authors "foo"]
        base-email = bar@example.com
        bill = Bill Murray
        jack = Jack Nicholson
        john = John Goodman
    END
    gitconfig.rewind
  end

  after :all do
    gitconfig.close
    gitconfig.unlink
  end

  describe '.new' do
    it 'accepts the path to a custom config file' do
      config.instance_variable_get(:@config_path).should == gitconfig.path
    end

    it 'also accepts no custom config file (will use gitconfig)' do
      GitAuthors::Config.new.instance_variable_get(:@config_path).should be_nil
    end
  end

  describe '#raw_output' do
    it 'should return the output of `git config`' do
      config.send(:raw_output).should == <<-END.gsub(/^ {8}/, '')
        git-authors.foo.base-email bar@example.com
        git-authors.foo.bill Bill Murray
        git-authors.foo.jack Jack Nicholson
        git-authors.foo.john John Goodman
      END
    end
  end

  describe '#to_hash' do
    it 'should return a hash of short names to full names' do
      config.send(:to_hash).should == {
        'foo' => {
          'base-email' => 'bar@example.com',
          'bill' => 'Bill Murray',
          'jack' => 'Jack Nicholson',
          'john' => 'John Goodman',
        }
      }
    end
  end
end
