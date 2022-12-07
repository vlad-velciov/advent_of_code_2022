# frozen_string_literal: true

describe Day7::CliLine do

  describe '#file_line?' do
    it 'finds a file line if size is integer' do
      expect(Day7::CliLine.new('1434 ls').file_line?).to eq(true)
    end

    it 'finds a file line if size is 0' do
      expect(Day7::CliLine.new('0 ls').file_line?).to eq(true)
    end

    it 'finds a file line if size is negative' do
      expect(Day7::CliLine.new('-243 ls').file_line?).to eq(true)
    end

    it 'is not a file line if the size has a letter' do
      expect(Day7::CliLine.new('-243a ls').file_line?).to eq(false)
    end
  end

  describe '#ls' do
    it 'identifies ls command' do
      expect(Day7::CliLine.new('$ ls').ls?).to eq(true)
    end

    it 'cd is not a ls commnad' do
      expect(Day7::CliLine.new('$ cd').ls?).to eq(false)
    end
  end

  describe '#cd_exit_directory?' do

    it 'identifies exiting a directory' do
      expect(Day7::CliLine.new('$ cd ..').cd_exit_directory?).to eq(true)
    end

    it 'cd in same dir is not an exit' do
      expect(Day7::CliLine.new('$ cd .').cd_exit_directory?).to eq(false)
    end

    it 'cd into a specific directory is not a exit' do
      expect(Day7::CliLine.new('$ cd foo').cd_exit_directory?).to eq(false)
    end
  end

  describe '#cd_enter_directory??' do

    it 'identifies entering a directory' do
      expect(Day7::CliLine.new('$ cd foo').cd_enter_directory?).to eq(true)
    end

    it 'cd in same dir is not an enter' do
      expect(Day7::CliLine.new('$ cd .').cd_enter_directory?).to eq(false)
    end

    it 'cd outside is not an enter' do
      expect(Day7::CliLine.new('$ cd ..').cd_enter_directory?).to eq(false)
    end
  end

  describe 'dir line' do
    it 'identifies a dir line' do
      expect(Day7::CliLine.new('dir sscj').dir_line?).to eq(true)
    end

    it 'a file line is not a dir line' do
      expect(Day7::CliLine.new('59022 dir').dir_line?).to eq(false)
    end
  end
end
