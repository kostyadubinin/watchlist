module FixturesHelper
  def read_fixture(filename)
    File.read(File.join("spec", "support", "fixtures", filename))
  end
end
