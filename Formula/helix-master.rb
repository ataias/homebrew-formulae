class HelixMaster < Formula
  desc "Post-modern modal text editor (master/nightly build)"
  homepage "https://helix-editor.com/"
  version "25.7.1+3beb268068"
  license "MPL-2.0"
  # helix_commit: 3beb268068

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-macos.tar.xz"
      sha256 "84d1a5ce0684abd3ab754bb255e9754f608d065ca317ea249779acb495a57166"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-linux.tar.xz"
      sha256 "c9b1e81c1b6edb04032ff89cbb6e7c50492a0f64dd1cb2ee5fc0a92e1e87365b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-x86_64-linux.tar.xz"
      sha256 "76c330041c91c5c274db9e697832e217b283efe393d60931f93de4094d504f19"
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
