class HelixMaster < Formula
  desc "Post-modern modal text editor (master/nightly build)"
  homepage "https://helix-editor.com/"
  version "25.7.1+54ee9a486c"
  license "MPL-2.0"
  # helix_commit: 54ee9a486c

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-macos.tar.xz"
      sha256 "f4920591ca074582b7a7916bea46e6e5d389a2eb46590aea60fb6967b06b575e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-aarch64-linux.tar.xz"
      sha256 "d09ddf0ade7a6c6fac8429dae16cc36f127abaa30d0b933677bd479d0160ed11"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ataias/homebrew-formulae/releases/download/helix-master-latest/helix-x86_64-linux.tar.xz"
      sha256 "a12075430d07605f5965975bbd3ec35dbcba0f1c68c4144d4b5ca6abb7448620"
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
