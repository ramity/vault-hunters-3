![splash](docs/splash.png)

> "Dockerized for your convenience by these fine lads."

# TOC:

- [Quick setup](#quick-setup)
- [Quick start](#quick-start)
- [Quick stop](#quick-stop)
- [View server log](#view-server-log)
- [Note on scripts](#note-on-scripts)
- [Enabling scripts](#enabling-scripts)
- [Manual backup](#manual-backup)
- [Ramdisk enhanced setup](#ramdisk-enhanced-setup)
- [Exporting from ram-disk](#exporting-from-ram-disk)
- [Importing to ram-disk](#importing-to-ram-disk)
- [Clearing ram-disk](#clearing-ram-disk)
- [Deleting ram-disk](#deleting-ram-disk)
- [Comments or questions?](#comments-or-questions)
- [Requests or suggestions?](#requests-or-suggestions)
- [Encountering a bug?](#encountering-a-bug)

# Quick setup

- Install docker
- Download files from [here](https://www.curseforge.com/minecraft/modpacks/vault-hunters-1-18-2/files/4516817)
- Unzip into the data directory
- (optional) Configure the ./data/server.properties file.
- (optional) Configure docker-compose.yml file's INIT_MEMORY and MAX_MEMORY definitions (default is 16G, 32G respectively).

> It's that simple.

# Quick start

Run the following command at the root directory:

```
docker compose up -d
```

# Quick stop

Run the following command:

```
docker stop vault_hunters
```

> Note that the server will automatically save when the container is stopped.

# View server log

Run the following command:

```
docker logs vault_hunters -f
```

> This can be used to monitor the health of your server and debug problems during runtime.

# Note on scripts

> Execute all scripts from the root directory on the host PC.

# Enabling scripts

Make scripts executable by running the following commands:

```
chmod +x ./scripts/ram_disk/*.sh
chmod +x ./scripts/*.sh
```

# Manual backup

Run the following script:

```
./scripts/backup.sh
```

# Ramdisk enhanced setup:

This repo supports the use of a ram-disk to further improve server load times and general responsiveness. Ram-disks are temporary mounts that do not persist after reboot. You have been warned.

- Install docker
- Download files from [here](https://www.curseforge.com/minecraft/modpacks/vault-hunters-1-18-2/files/4516817)
- Unzip into the data directory
- (optional) Configure the ./data/server.properties file.
- (optional) Configure docker-compose.yml file's INIT_MEMORY and MAX_MEMORY definitions (default is 16G, 32G respectively).
- Create ram-disk:

```
./scripts/ram_disk/create.sh
```

- Import the contents of `data` directory into `ram_disk` directory:

```
./scripts/ram_disk/data_import.sh
```

- Modify the docker-compose.yml file to uncomment the RAM-DISK volumes and working_dir definitions and comment the DATA FS volumes and working_dir definitions.

## Start:

- Run the following command:

```
docker compose up -d
```

## Stop:

- Run the following command:

```
docker stop vault_hunters
```

# Exporting from ram-disk

To export data from the ram-disk, there are two provided methods:

- `./scripts/ram_disk/data_export.sh` copies the contents of the `ram_disk` directory and **overwrites** the contents of the `data` directory.
- `./scripts/ram_disk/zip_export.sh` copies the contents of the `ram_disk` directory and creates a **new** zip archive in the `exports` directory.

Examples:

```
# ram_disk -> data
./script/ram_disk/data_export.sh

# ram_disk -> export/%.zip
./script/ram_disk/zip_export.sh
```

# Importing to ram-disk

To import data into the ram-disk, there are two provided methods:

- `./scripts/ram_disk/data_import.sh` copies the contents of the `data` directory and **overwrites** the contents of the `ram_disk` directory.
- `./scripts/ram_disk/zip_import.sh ZIP_FILE_PATH` unzips the the specified zip archive and **overwrites** the contents of the  `ram_disk` directory.

Examples:

```
# data -> ram_disk
./scripts/ram_disk/data_import.sh

# export/%.zip -> ram_disk
./scripts/ram_disk/zip_import.sh ./exports/####.zip
```

# Clearing ram-disk

To clear the contents of the ram-disk, run the following script:

```
./scripts/ram_disk/clear.sh
```

# Deleting ram-disk

To delete the ram-disk mount, run the following script:

```
./scripts/ram_disk/delete.sh
```

> To prevent accidental loss of data, the contents of the ram_disk directory must be empty.

# Comments or Questions?

Open a new question [here](https://github.com/ramity/vault-hunters-3/issues/new?assignees=ramity&labels=question).

# Requests or Suggestions?

Submit a new feature request [here](https://github.com/ramity/vault-hunters-3/issues/new?assignees=ramity&labels=enhancement).

# Encountering a bug?

Create a new bug report [here](https://github.com/ramity/vault-hunters-3/issues/new?assignees=ramity&labels=bug).