# Generated from the complete, verified release index. No credentials are stored here.
class Hivenal < Formula
  desc "Headless engine and terminal view for the hive floor"
  homepage "https://github.com/chalasz/hivenal-releases"
  version "0.1.2"
  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/chalasz/hivenal-releases/releases/download/v0.1.2/hivenal-v0.1.2-darwin-arm64.tar.gz"
      sha256 "58a68b95b7cf0fb598c27247a69d023110280b6a8706b8313fb0090520e4838b"
    end
    on_intel do
      url "https://github.com/chalasz/hivenal-releases/releases/download/v0.1.2/hivenal-v0.1.2-darwin-x64.tar.gz"
      sha256 "47cd12ab362995d60e8f2e70a7477000a19d9c38316e6858d0ffa0fde0351569"
    end
  end

  def install
    libexec.install Dir["*"]
    prefix.install_symlink libexec/"LICENSE"
    bin.install_symlink libexec/"bin/hivenal"
  end

  def caveats
    <<~EOS
      On first use, hivenal copies its payload into your versioned release store.
      To select this version after an upgrade, run:
        "#{opt_bin}/hivenal" update --bundle "#{opt_libexec}"
      Existing offices keep their release until you stop and start them.
    EOS
  end

  test do
    assert_match "hivenal", shell_output("#{bin}/hivenal --version")
    output = with_env(HOME: testpath.to_s) { shell_output("#{bin}/hivenal release verify") }
    assert_match "MANIFEST.sha256", output
    assert_equal "releases/v#{version}", (testpath/"Library/Application Support/hivenal/current").readlink.to_s
  end
end
