# Generated from the complete, verified release index. No credentials are stored here.
class Hivenal < Formula
  desc "Headless engine and terminal view for the hive floor"
  homepage "https://github.com/chalasz/hivenal-releases"
  version "0.1.1"
  depends_on macos: :sequoia

  download_headers = ["Accept: application/octet-stream"]
  on_macos do
    on_arm do
      url "https://api.github.com/repos/chalasz/hivenal-releases/releases/assets/644219155",
          using: :curl, headers: download_headers
      sha256 "1d05069556cb0dc56ad459e6f95efde3469da323746f05797cfdd54bbe3fc50a"
    end
    on_intel do
      url "https://api.github.com/repos/chalasz/hivenal-releases/releases/assets/644219158",
          using: :curl, headers: download_headers
      sha256 "5906ce4dc2dcb9132d2a561872527bcfbe652c4a8cc69b60fa3327a60cdf1cb1"
    end
  end

  def install
    libexec.install Dir["*"]
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
  end
end
