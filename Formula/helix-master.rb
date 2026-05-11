class HelixMaster < Formula
  desc "Post-modern modal text editor (master/nightly build)"
  homepage "https://helix-editor.com/"
  version "25.7.1+a8b359b0f3"
  license "MPL-2.0"
  # helix_commit: a8b359b0f3

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-macos.tar.xz"
      sha256 "620f0e5e7a845c3279e083b6e19d53ded1bff60c2bc41ead4ec16f0b274dc307"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-linux.tar.xz"
      sha256 "1d0e55422c1ae057b21588d351c303f080861e0cfccb2bcc38e5624cbee91edb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-x86_64-linux.tar.xz"
      sha256 "5f12f1d9fd6a4ffab4413bf9327e11adb985656ff6543e9ff7ae52a0eeac7266"
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
