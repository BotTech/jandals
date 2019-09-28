# OpenPGP

If you don't have an OpenPGP key already then you will need to create one.

This requires some manual steps as we want to reduce the exposure of the master key.

## 0 - Prerequisites

You will need:
- 3 x USB flash drives (1 must be at least 8GB)
- A laptop that supports [Tails] (see [Tails - Known issues])

### Notes

#### MacBook Pro

If your MacBook Pro has a touchbar then, at the time of writing this, you will need an external keyboard and/or mouse.
Also keep in mind that you need to be able to plug in 2 USB flash drives at the same time as the keyboard or mouse... Good luck!

The reason for this is that Linux does not have a driver for the SPI keyboard and trackpad that is in the later model MacBook Pros.
According to [Dunedan/mbp-2016-linux] this is now supported in Linux kernel version 5.3.

The [current kernel version in Tails][Tails current version] (4.19.0-5) is not up to 5.3 yet.
It has to at least wait for the [Debian unstable kernel version] (5.2.17-1) to update to 5.3.
Even when Debian supports 5.3, the [Tails kernel] may not support it.

That means currently not a MacBook Pro with a touchbar (see ) as the keyboard does not work

## 1 - Download and Install Tails

Follow the [Tails installation] instructions.

### Notes

#### dd

If using `dd` rather than _Etcher_ then it may appear like progress stalls.
It does this for quite a few minutes so just wait it out.

#### MacBook Pro

The latest MacBook Pro's prevent you booting from an external drive.
You will need to temporarily [enable booting from external media][Apple External Boot].

# 2 - Enable Tails Persistent Volume

We are going to store the master private key on the same USB that has Tails. To do this we need to:
# Boot into Tails.
# Enable [Tails persistent volume].
# Make sure to select GnuPG.
# Restart Tails.

# 3 - Generate OpenPGP Key

We are going to follow the [Airgapped Master Key instructions] but we will use [Ed25519] instead of [RSA] because [fuck RSA].

⚠️ WARNING: Make sure that you double check the time zone of Tails.
If you don't then you may end up with a key that is generated in the future.
This isn't a big deal but you will have to wait until enough time has passed before you can import the key.

You can also [edit the key][OpenPGP Key Management] to add extra identities or a photo if you wish.

You should end up with something like this when you are done:
```
amnesia@amnesia:~$ gpg --list-secret-keys
/home/amnesia/.gnupg/pubring.kbx
--------------------------------
sec   ed25519/0x21DE1CAE59762A0F 2019-09-28 [C] [expires: 2020-09-27]
      Key fingerprint = 2709 1DEC CC42 4635 4299  569C 21DE 1CAE 5976 2A0F
uid           [ultimate] Jason Pickens <jason.pickens@lightbend.com>
uid           [ultimate] Jason Pickens <jasonpickensnz@gmail.com>
ssb   ed25519/0xC4A8C75C7876F1B5 2019-09-28 [S] [expires: 2020-09-27]
ssb   cv25519/0X3D1C7D5C8E2FF8AE 2019-09-28 [E] [expires: 2020-09-27]
ssb   ed25519/0X7D3DD2E3A364DA82 2019-09-28 [A] [expires: 2020-09-27]
```

# 4 - Export

If you haven't already then keep following the [Airgapped Master Key instructions] and export:
* Revocation Certificate
* Public Keys
* Secret Subkeys (only the subkeys!)

# 5 - Import

Again keep following the [Airgapped Master Key instructions] and import:
* Public Keys
* Secret Subkeys

Don't forget to `trust` your new key.

## YubiKey

If you are forunate enough to have a YubiKey that has [firmware version 5.2.3][YubiKey 5.2.3] or later then you can also [import your key onto your YubiKey][YubiKey OpenPGP].

You may even disregard everything above and generate the key on your YubiKey.
I wouldn't do this since I take my YubiKey with me and am far more likely to loose it so I don't want my master key on here.


[Airgapped Master Key instructions]: https://wiki.debian.org/GnuPG/AirgappedMasterKey
[Apple External Boot]: https://support.apple.com/en-nz/HT208198
[Debian unstable kernel version]: https://salsa.debian.org/kernel-team/linux/blob/sid/debian/changelog
[Dunedan/mbp-2016-linux]: https://github.com/Dunedan/mbp-2016-linux#keyboard--touchpad
[Ed25519]: https://en.wikipedia.org/wiki/EdDSA#Ed25519
[fuck RSA]: https://blog.trailofbits.com/2019/07/08/fuck-rsa/
[OpenPGP Key Management]: https://www.gnupg.org/documentation/manuals/gnupg/OpenPGP-Key-Management.html
[RSA}: https://en.wikipedia.org/wiki/RSA_(cryptosystem)
[Tails]: https://tails.boum.org
[Tails current version]: https://git-tails.immerda.ch/tails/plain/config/amnesia
[Tails kernel]: https://tails.boum.org/contribute/Linux_kernel/
[Tails known issues]: https://tails.boum.org/support/known_issues/index.en.html
[Tails installation]: https://tails.boum.org/install/index.en.html
[Tails persistent volume]: https://tails.boum.org/doc/first_steps/persistence/configure/index.en.html#gnupg
[YubiKey 5.2.3]: https://support.yubico.com/support/solutions/articles/15000027139-yubikey-5-2-3-enhancements-to-openpgp-3-4-support
[YubiKey OpenPGP]: https://support.yubico.com/support/solutions/articles/15000006420-using-your-yubikey-with-openpgp#Generating_the_Key_on_Your_Local_System_(Recommended)arh698
