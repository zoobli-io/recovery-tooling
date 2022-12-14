# What is Windows 11 for Workstations?

Windows 11 Pro is primarily intended for business environments and advanced home users. The Pro edition has all the features of Windows 11 Home, plus additional security and management features. For example, consider the Group Policy component, which allows system administrators to manage multiple computers and change settings at once. You can also use a customized Microsoft Store for Business with the Pro version. Windows 10 Pro for Workstations has even more features, such as support for more working memory.

[More about Windows 11 for Workstations](https://www.microsoft.com/en-us/windows/business/windows-11-pro-workstations)

## Contents

- [Understanding and Using SysPrep for Windows 11 for Workstations](#understanding-and-using-sysprep-for-windows-11-for-workstations)
- [Defining Sysprep](#defining-sysprep)
- [About Audit Mode with Sysprep](#about-audit-mode-with-sysprep)
- [Understanding The Benefits and Drawbacks of Using Windows 11 Sysprep](#understanding-the-benefits-and-drawbacks-of-using-windows-11-sysprep)
- [Guest Virtual Machine Through Parallels RAS with Sysprep](#guest-virtual-machine-through-parallels-ras-with-sysprep)

## Understanding and Using SysPrep for Windows 11 for Workstations

Sysprep, which stands for system preparation, is a Microsoft tool that IT administrators can leverage to automate the deployment of Windows operating systems (OSs). IT teams can use this tool in virtualized environments to prepare Windows OS images that can be cloned multiple times.

## Defining Sysprep

Sysprep is the go-to utility tool that IT administrators have used to prepare Windows OS images for deployment for a long time. Originally, Microsoft released this tool for use with Windows NT 4.0 and newer versions of Windows OSs. Windows Vista was the first Windows version to include a release of Sysprep that had an “out-of- the-box” installation that was completely independent of the hardware abstraction layer (HAL). Typically, IT administrators create a template for a system build and customize the OS and the desktop environment by installing the necessary drivers and applications. During the build process, the OS allocates the system with a unique SID and computer name. Each time you duplicate the template, you also clone the SID and computer name. IT administrators can also configure other Windows settings at this stage.

*Sysprep has three essential features:*

- **Build-to-plan (BTP) image**. In a BTP scenario, you create a single Windows OS template for use on PCs with the same hardware configuration. You then capture the template and use it to install on other computers without any modifications to the image. For example, a company that manufactures a high volume of computers, such as HP or Lenovo, could use Sysprep to create a standard desktop image consisting of drivers and applications and use the template for all the identical PCs.
- **Build-to-order (BTO) image**. In a BTO scenario, you begin with a Windows reference template. After deploying the image, you add extra updates like drivers and applications unique to the hardware. For example, a PC manufacturer that builds customized computers could use the Windows image as a base template for all its products. It could then customize such a template with hardware-specific drivers and applications based on customer requirements.
- **Audit mode**. Another feature of Sysprep is audit mode, which customizes the Windows image.

## About Audit Mode with Sysprep

Audit Mode enables users to add drivers, applications, and scripts to the Windows installation before sending the PC to a customer or capturing the image for reuse within a large organization. You can install drivers, applications, or other updates that the Windows 11 installation needs to run at this stage. The Audit Mode also enables users to test the image, ensuring that it operates correctly and as expected.

To create a template for cloning, you first need to install install Windows 11 on the PC or VM and then configure the OS to your requirements by installing drivers and specific applications. Below are four things that you shouldn’t do when running Windows 11 in Audit Mode:

- Use Windows Updates to install the patches, as this will result in a Windows 11 Sysprep error.
- Connect the PC to the internet.
- Install applications from the Microsoft Store.
- Join the PC to a domain on the company network.

## Understanding The Benefits and Drawbacks of Using Windows 11 Sysprep

*Sysprep provides various benefits, including:*

- **It eliminates system-specific data from Windows 11.** IT teams can remove various OS-specific information from an installed Windows image, including computer name and SID, allowing the OS to be installed on multiple PCs across the organization.
- **It can completely automate the setup process for Windows 11.** The Windows template can help users automate tasks often undertaken during setup, such as joining the Active Directory (AD). This allows them to run the installation processes in an unattended mode.
- **It can reset the Windows Product Activation.** IT teams can leverage Sysprep to reset Windows Product Activation up to three times.
Despite its benefits, Sysprep has two primary limitations. First, you can use the tool only when creating an image that will be used to set up new Windows 11 installations. You can’t use Sysprep to change the Windows setup that has already been deployed and running, as doing so destroys the OS. Second, you can use Sysprep only up to eight times for a given Windows OS image. After the eighth time, you have to recreate the Windows template

## Guest Virtual Machine Through Parallels RAS with Sysprep

In a fast-paced and complex business environment, organizations must have the appropriate tools to deliver the resources employees need for productivity in the least amount of time possible. Parallels RAS is a convenient and easy-to-use virtual desktop infrastructure (VDI) tool that IT administrators can leverage to simplify the deployment and management of virtual workloads.

The Parallels RAS templates allow organizations to set up and manage as many guest VMs as they need on the fly. Parallels RAS is highly flexible as it enables IT teams to choose between Sysprep and RASprep, the platform’s unique tool for preparing Windows-based OSs in VMs after cloning them from a master image.

However, while Sysprep and RASprep provide similar services, RASprep has superior functionalities. For example, IT teams can leverage RASprep to create new computer accounts in AD for each guest VM and join the guest VM to the AD domain. RASprep is also more efficient and faster than Sysprep because it requires few configurable parameters and minimal reboots.

IT teams can leverage these features alongside others, like linked cloning capabilities, to simplify the deployment and management of VDI environments that are often complex by nature.

---

## Preparation

- 1. run uup_download_xxx
> Downloading and creating the ISO can take up to two hours.
- 2. Open the generated ISO and copy the files inside the repository.

### USB drive preparation

- 1. Format an USB drive using FAT32
- 2. Make the device bootable using DISKPART, Disk Manager or other way
- 3. Copy the whole repository on the USB drive

## Windows installation

- 1. Connect the USB drive on the target computer and boot the computer from the drive

## Windows customization

- You can install all Windows software, drivers and updates you want in the final 
production image.

## Recovery software installation

- 1. Open Tools/Recovery/OEM/ and run the Sysprep.cmd script.

## Dynamic recovery image VS Push-Button reset

## Supported configuration

| Partition | Size      | File system | Volume name      | Partition type | Role            | Resizable? |
|-----------|-----------|-------------|------------------|----------------|-----------------|------------|
| 0         | 250 Mb    | FAT32       | System           | EFI            | Boot            | No         |
| 1         | 16 Mb     | MSR         | N/A              | MSR            | System reserved | No         |
| 2         | 60 000 Mb | NTFS        | Windows          | Primary        | OS              | Yes        |
| 3         | All       | NTFS        | Data             | Primary        | Data            | N/A        |
| 4         | 700 Mb    | NTFS        | Windows RE tools | Primary        | Recovery tools  | No         |

<details>
  <summary>Explenation configuration</summary>

### About the system partition roles

**Boot:** The boot partition stores the bootloader.

**System reserved:** The System Reserved partition contains two important things:.

- The Boot Manager and Boot Configuration Data: When your computer starts, the Windows Boot Manager reads the boot data from the Boot Configuration Data (BCD) Store. Your computer starts the boot loader off of the System Reserved partition, which in turn starts Windows from your system drive. 

- The startup files used for BitLocker Drive Encryption: If you ever decide to encrypt your hard drive with BitLocker drive encryption, the System Reserved partition contains the necessary files for starting your computer. Your computer boots the unencrypted System Reserved partition, and then decrypts the main encrypted drive and starts the encrypted Windows system.
The System Reserved partition is essential if you want to use BitLocker drive encryption, which can’t function otherwise.

**OS:** Contains Windows 11 PRO for Workstations.

**Data partition:** Secondary partition to store your personal files. Easier to backup, but you must 
be sure of the size of the Windows partition to prevent problems with low disk space.

**Recovery tools:** Contains the recovery tools.

> Based on Microsoft documentation, the recovery partition will be the last of the 
disk. *Resizable:* If “YES”, you can edit the DISKPART script to change the partition size to fit your needs. If “No”, 
please don’t try to change the specified size without testing first.

</details>

## Additional Requirements (Linux - Mac os)

 * cabextract - to extract cabs
 * wimlib-imagex - to export files from metadata ESD
 * chntpw - to modify registry of first index of boot.wim
 * genisoimage or mkisofs - to create ISO image

### Linux
-----
If you use Debian or Ubuntu based distribution you can install these using
the following command:

```bash
sudo apt-get install cabextract wimtools chntpw genisoimage
```

If you use Arch Linux you can also install these using the following command:
```bash
sudo pacman -S cabextract wimlib chntpw cdrtools
```

If you use any other distribution, you'll need to check its repository for the
appropriate packages.

### macOS
-----
macOS requires [Homebrew](https://brew.sh) to install the prerequisite software.
After Homebrew was installed, you can install the requirements using:

```bash
brew tap sidneys/homebrew
brew install cabextract wimlib cdrtools sidneys/homebrew/chntpw
```
