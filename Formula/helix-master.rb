class HelixMaster < Formula
  desc "Post-modern modal text editor (master/nightly build)"
  homepage "https://helix-editor.com/"
  version "25.7.1+a62d374fcb"
  license "MPL-2.0"
  # helix_commit: a62d374fcb

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-macos.tar.xz"
      sha256 "c119262e228c40c4b328672372234972186958b42ff25d70ddd432dd0428f5b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-linux.tar.xz"
      sha256 "2161a5a4010ceef2b50e7ca8992c05f3abc5d304c670b269d40da7992c22adc0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-x86_64-linux.tar.xz"
      sha256 "92a91769519510e12d96ba1b179cb4b83617c9193577015760e6b7a45cc68888"
    end
  end

  conflicts_with "helix", because: "both install a `hx` binary"

  def install
    bin.install "hx"
    libexec.install "runtime"
    bin.env_script_all_files libexec/"bin", HELIX_RUNTIME: libexec/"runtime"
  end

  test do
    assert_match "helix", shell_output("#{bin}/hx --version")
  end
end
