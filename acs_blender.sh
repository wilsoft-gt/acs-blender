#!/bin/bash

#Lee los argumentos para recompilar blender
if [ "$1" == "recompilar" ] || [ "$1" == "recompile" ] ; then
	if [ "$1" == "recompilar" ] ; then
		echo "Recompilando"
	fi
	if [ "$1" == "recompile" ] ; then
		echo "Recompiling"
	fi

	cd
	cd ~/blender-scr
	cd blender
	git add .
	git commit -m "adding local changes"
	git pull --rebase
	git submodule foreach git pull --rebase origin master

	#cambia el -j3 por el numero de nucleos de tu procesador +1
	#por ejemplo tu procesador tiene 4 nucleos seria asi -j5
	sudo make -j3 BUILD_CMAKE_ARGS="-U *SNDFILE* -U *PYTHON* -U *BOOST* -U *Boost* -U *OPENCOLORIO* -U *OPENEXR* -U *OPENIMAGEIO* -U *LLVM* -U *CYCLES* -U *OPENSUBDIV* -U *OPENVDB* -U *COLLADA* -U *FFMPEG* -D WITH_CODEC_SNDFILE=ON -D PYTHON_VERSION=3.5 -D WITH_INSTALL_PORTABLE=OFF -D WITH_OPENCOLORIO=ON -D OPENCOLORIO_ROOT_DIR=/opt/lib/ocio -D WITH_OPENIMAGEIO=ON -D OPENIMAGEIO_ROOT_DIR=/opt/lib/oiio -D WITH_CYCLES_OSL=OFF -D WITH_LLVM=OFF -D WITH_OPENSUBDIV=ON -D OPENSUBDIV_ROOT_DIR=/opt/lib/osd -D WITH_OPENVDB=ON -D WITH_OPENVDB_BLOSC=ON -D WITH_OPENCOLLADA=ON -D WITH_CODEC_FFMPEG=ON -D FFMPEG_LIBRARIES='avformat;avcodec;avutil;avdevice;swscale;swresample;lzma;rt;theoradec;theora;theoraenc;vorbisenc;vorbisfile;vorbis;ogg;xvidcore;vpx;mp3lame;x264;openjpeg;openjpeg_JPWL'"

	cd ../build_linux
	sudo make install
	echo "Done / Finalizado"
	exit
fi


spa_da1="Derechos de Autor"
spa_da2="(c) 2016 Wilson Omar Romero Baños (wilsoftBL)"
spa_da3="ACS-BLENDER está licenciada bajo la Licencia Creative Commons"
spa_da4="Atribución-CompartirIgual 4.0 Internacional. Para ver una copia" 
spa_da5="de esta licencia, visita http://creativecommons.org/licenses/by-sa/4.0/."
spa_da6="para mas informacion y actualizaciones visite https://wilsoftbl.blogspot.com/"

eng_cp1="Copyright"
eng_cp2="(c) 2016 Wilson Omar Romero Baños (wilsoftBL)"
eng_cp3="This work is licensed under the Creative Commons"
eng_cp4="Attribution-ShareAlike 4.0 International License. To view a copy"
eng_cp5="of this license, visit http://creativecommons.org/licenses/by-sa/4.0/."
eng_cp6="For more info and updates go to https://wilsoftbl.blogspot.com/"

#center a text in terminal 
#printf "%*s\n" $(((${#}+$COLUMNS)/2)) "$"
#printf "%*s\n" $(((${#variable}+$COLUMNS)/2)) "$variable"

#bucle para los espacios
#for ((espacio=0; espacio<;espacio++)) do echo "" 
#done



clear
COLUMNS=$(tput cols) 
banner="###########################################################################"
acs_blender_txt="###################       ACS-BLENDER Beta 1.2       ######################"
#variables generales
#variables del menu principal eng/spa/other
inicio_languaje_txt="Idioma/Language"
inicio_languaje_eng="1) English"
inicio_languaje_spa="  2) Español"
inicio_languaje_oth="3) Otro"
inicio_languaje_null="Elija una opcion del menu"
inicio_languaje_sel="Elija una opcion / Choose an option"
select_os_ub="1)Ubuntu"
select_os_fe="2)Fedora"


#eng menu
eng_txt_select_os="Please select your Operating System"
eng_txt_dl_envu="Preparing environment for ubuntu, please wait."
eng_txt_dl_envf="Preparing environment for fedora, please wait."
eng_txt_dl_sc="Downloading the source code"
eng_txt_dl_pe="Please take a sit and wait for the next step."
eng_txt_dl_cancel="If you want to cancel the script press CTRL+C."
eng_txt_press_ent="Press ENTER"
eng_txt_dl_dep="Downloading dependencies (without OSL, because some compatibity issues)"
eng_txt_compile="Compiling, it will take a moment"
eng_txt_susccess="The compilation has been successfully"
eng_txt_thaks="Thanks for use this script, enjoy Blender :)"

#spa menu
spa_txt_seleccionar_so="Seleccione su Sistema Operativo"
spa_txt_dl_entu="Preparando entorno para ubuntu, porfavor espere."
spa_txt_dl_entf="Preparando entorno para fedora, porfavor espere."
spa_txt_dl_cf="Descargando el codigo fuente,"
spa_txt_dl_pa="porfavor tome asiento y espere para el siguiente paso."
spa_txt_dl_cancelar="Si quiere cancelar el script presione CTRL+C"
spa_txt_presione_ent="Presione ENTER"
spa_txt_dl_dep="Descargando dependencias (excluyendo OSL por compatibilidad)"
spa_txt_compilar="Compilando, esto tomara algun tiempo"
spa_txt_exito="La compilacion ha finalizado exitosamente"
spa_txt_gracias="Gracias por utilizar este script, disfruta Blender :)"

#other menu
oth_txt_dl_oo="This is otro idioma, in caso que somebody helps traduciendo"
oth_txt_dl_cccc="If you quiere cancelar the script solo press CTRL+C"

oth_txt_dl_dep="ñalskfd dependencies"
#opcion invalida
inv_option_txt="Opcion invalida/Invalid Option"

###########################################################################
###########################################################################
for ((espacio=0; espacio<4;espacio++)) do echo "" 
done

printf "%*s\n" $(((${#banner}+$COLUMNS)/2)) "$banner"
printf "%*s\n" $(((${#acs_blender_txt}+$COLUMNS)/2)) "$acs_blender_txt"
printf "%*s\n" $(((${#banner}+$COLUMNS)/2)) "$banner"
echo ""
echo ""
printf "%*s\n" $(((${#inicio_languaje_txt}+$COLUMNS)/2)) "$inicio_languaje_txt"
echo ""
echo ""
printf "%*s\n" $(((${#inicio_languaje_eng}+$COLUMNS)/2)) "$inicio_languaje_eng"
printf "%*s\n" $(((${#inicio_languaje_spa}+$COLUMNS)/2)) "$inicio_languaje_spa"
#printf "%*s\n" $(((${#inicio_languaje_oth}+$COLUMNS)/2)) "$inicio_languaje_oth"
echo ""
printf "%*s\n" $(((${#inicio_languaje_sel}+$COLUMNS)/2)) "$inicio_languaje_sel"
read inicio_menu_opt

clear
case $inicio_menu_opt in
	

	###########################################################################
	###########################################################################
	#menu eng
	1)	
	#Select OS
	for ((espacio=0; espacio<11;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#eng_txt_select_os}+$COLUMNS)/2)) "$eng_txt_select_os"
	printf "%*s\n" $(((${#select_os_ub}+$COLUMNS)/2)) "$select_os_ub"
	printf "%*s\n" $(((${#select_os_fe}+$COLUMNS)/2)) "$select_os_fe"
	read select_os
	case $select_os in


		1)
		#preparing environment text ubuntu
		clear
		for ((espacio=0; espacio<11;espacio++)) do echo "" 
		done
		printf "%*s\n" $(((${#eng_txt_dl_envu}+$COLUMNS)/2)) "$eng_txt_dl_envu"
		printf "%*s\n" $(((${#eng_txt_press_ent}+$COLUMNS)/2)) "$eng_txt_press_ent"	
		read key "enter"

		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install git build-essential
		cd
		mkdir blender-scr
		cd blender-scr
		#commands to set up environment ubuntu

		;;
		
		#Preparing environment text Fedora
		2)
		clear
		for ((espacio=0; espacio<11;espacio++)) do echo "" 
		done
		printf "%*s\n" $(((${#eng_txt_dl_envf}+$COLUMNS)/2)) "$eng_txt_dl_envf"
		printf "%*s\n" $(((${#eng_txt_press_ent}+$COLUMNS)/2)) "$eng_txt_press_ent"	
		read key "enter"

		sudo yum update
		sudo yum upgrade
		sudo yum install git
		sudo yum groupinstall "Development Tools" "Development Libraries"
		cd
		mkdir blender-scr
		cd blender-scr

		;;
	esac
	
		
	#download source code text
	clear
	for ((espacio=0; espacio<10;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#eng_txt_dl_sc}+$COLUMNS)/2)) "$eng_txt_dl_sc"
	printf "%*s\n" $(((${#eng_txt_dl_pe}+$COLUMNS)/2)) "$eng_txt_dl_pe"
	printf "%*s\n" $(((${#eng_txt_dl_cancel}+$COLUMNS)/2)) "$eng_txt_dl_cancel"
	printf "%*s\n" $(((${#eng_txt_press_ent}+$COLUMNS)/2)) "$eng_txt_press_ent"
	read key "enter"
	git clone http://git.blender.org/blender.git
	#commands download source code

	#Instaling dependencies
	clear	
	for ((espacio=0; espacio<11;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#eng_txt_dl_dep}+$COLUMNS)/2)) "$eng_txt_dl_dep"
	printf "%*s\n" $(((${#eng_txt_press_ent}+$COLUMNS)/2)) "$eng_txt_press_ent"
	read key "enter"
	./blender/build_files/build_environment/install_deps.sh --with-all --skip-osl --skip-llvm
	#command install dependencies

	#Compiling source code text
	clear
	for ((espacio=0; espacio<11;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#eng_txt_compile}+$COLUMNS)/2)) "$eng_txt_compile"
	printf "%*s\n" $(((${#eng_txt_press_ent}+$COLUMNS)/2)) "$eng_txt_press_ent"
	read key "enter"

	cd blender
	make -j3 BUILD_CMAKE_ARGS="-U *SNDFILE* -U *PYTHON* -U *BOOST* -U *Boost* -U *OPENCOLORIO* -U *OPENEXR* -U *OPENIMAGEIO* -U *LLVM* -U *CYCLES* -U *OPENSUBDIV* -U *OPENVDB* -U *COLLADA* -U *FFMPEG* -D WITH_CODEC_SNDFILE=ON -D PYTHON_VERSION=3.5 -D WITH_INSTALL_PORTABLE=OFF -D WITH_OPENCOLORIO=ON -D OPENCOLORIO_ROOT_DIR=/opt/lib/ocio -D WITH_OPENIMAGEIO=ON -D OPENIMAGEIO_ROOT_DIR=/opt/lib/oiio -D WITH_CYCLES_OSL=OFF -D WITH_LLVM=OFF -D WITH_OPENSUBDIV=ON -D OPENSUBDIV_ROOT_DIR=/opt/lib/osd -D WITH_OPENVDB=ON -D WITH_OPENVDB_BLOSC=ON -D WITH_OPENCOLLADA=ON -D WITH_CODEC_FFMPEG=ON -D FFMPEG_LIBRARIES='avformat;avcodec;avutil;avdevice;swscale;swresample;lzma;rt;theoradec;theora;theoraenc;vorbisenc;vorbisfile;vorbis;ogg;xvidcore;vpx;mp3lame;x264;openjpeg;openjpeg_JPWL'"

	cd ../build_linux
	sudo make install

	for ((espacio=0; espacio<3;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#eng_txt_susccess}+$COLUMNS)/2)) "$eng_txt_susccess"
	printf "%*s\n" $(((${#eng_txt_press_ent}+$COLUMNS)/2)) "$eng_txt_press_ent"
	read key "enter"
	#Compiling source code commands

	#finishing and copyright
	clear
	for ((espacio=0; espacio<7;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#eng_cp1}+$COLUMNS)/2)) "$eng_cp1"
	printf "%*s\n" $(((${#eng_cp2}+$COLUMNS)/2)) "$eng_cp2"
	printf "%*s\n" $(((${#eng_cp3}+$COLUMNS)/2)) "$eng_cp3"
	printf "%*s\n" $(((${#eng_cp4}+$COLUMNS)/2)) "$eng_cp4"
	printf "%*s\n" $(((${#eng_cp5}+$COLUMNS)/2)) "$eng_cp5"
	printf "%*s\n" $(((${#eng_cp6}+$COLUMNS)/2)) "$eng_cp6"
	printf "%*s\n" $(((${#eng_txt_thaks}+$COLUMNS)/2)) "$eng_txt_thaks"
	printf "%*s\n" $(((${#eng_txt_press_ent}+$COLUMNS)/2)) "$eng_txt_press_ent"
	read key "enter"

	;;



	###########################################################################
	###########################################################################
	#menu spa
	2)
	#preparar el sistema
	for ((espacio=0; espacio<11;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#spa_txt_seleccionar_so}+$COLUMNS)/2)) "$spa_txt_seleccionar_so"
	printf "%*s\n" $(((${#select_os_ub}+$COLUMNS)/2)) "$select_os_ub"
	printf "%*s\n" $(((${#select_os_fe}+$COLUMNS)/2)) "$select_os_fe"
	read select_os
	case $select_os in


		1)
		#preparando entorno para ubuntu
		clear
		for ((espacio=0; espacio<11;espacio++)) do echo "" 
		done
		printf "%*s\n" $(((${#spa_txt_dl_entu}+$COLUMNS)/2)) "$spa_txt_dl_entu"
		printf "%*s\n" $(((${#spa_txt_presione_ent}+$COLUMNS)/2)) "$spa_txt_presione_ent"
		read key "enter"

		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install git build-essential
		cd
		mkdir blender-scr
		cd blender-scr
		#comandos para preparar el entorno ubuntu

		;;
		
		#Preparando el entorno para Fedora
		2)
		clear
		for ((espacio=0; espacio<11;espacio++)) do echo "" 
		done
		printf "%*s\n" $(((${#spa_txt_dl_entf}+$COLUMNS)/2)) "$spa_txt_dl_entf"
		printf "%*s\n" $(((${#spa_txt_presione_ent}+$COLUMNS)/2)) "$spa_txt_presione_ent"
		read key "enter"

		sudo yum update
		sudo yum upgrade
		sudo yum install git
		sudo yum groupinstall "Development Tools" "Development Libraries"
		cd
		mkdir blender-scr
		cd blender-scr

		;;
		
	esac

	#descargar codigo fuente
	clear
	for ((espacio=0; espacio<10;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#spa_txt_dl_cf}+$COLUMNS)/2)) "$spa_txt_dl_cf"
	printf "%*s\n" $(((${#spa_txt_dl_pa}+$COLUMNS)/2)) "$spa_txt_dl_pa"
	printf "%*s\n" $(((${#spa_txt_dl_cancelar}+$COLUMNS)/2)) "$spa_txt_dl_cancelar"
	printf "%*s\n" $(((${#spa_txt_presione_ent}+$COLUMNS)/2)) "$spa_txt_presione_ent"
	read key "enter"
	git clone http://git.blender.org/blender.git
	#comandos para descargar codigo fuente

	#Descargando dependencias
	clear
	for ((espacio=0; espacio<11;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#spa_txt_dl_dep}+$COLUMNS)/2)) "$spa_txt_dl_dep"
	printf "%*s\n" $(((${#spa_txt_presione_ent}+$COLUMNS)/2)) "$spa_txt_presione_ent"
	read key "enter"
	./blender/build_files/build_environment/install_deps.sh --with-all --skip-osl --skip-llvm

	#comandos para descargar dependencias

	#compilando el codigo texto
	clear
	for ((espacio=0; espacio<11;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#spa_txt_compilar}+$COLUMNS)/2)) "$spa_txt_compilar"
	printf "%*s\n" $(((${#spa_txt_presione_ent}+$COLUMNS)/2)) "$spa_txt_presione_ent"
	read key "enter"

	cd blender
	make -j3 BUILD_CMAKE_ARGS="-U *SNDFILE* -U *PYTHON* -U *BOOST* -U *Boost* -U *OPENCOLORIO* -U *OPENEXR* -U *OPENIMAGEIO* -U *LLVM* -U *CYCLES* -U *OPENSUBDIV* -U *OPENVDB* -U *COLLADA* -U *FFMPEG* -D WITH_CODEC_SNDFILE=ON -D PYTHON_VERSION=3.5 -D WITH_INSTALL_PORTABLE=OFF -D WITH_OPENCOLORIO=ON -D OPENCOLORIO_ROOT_DIR=/opt/lib/ocio -D WITH_OPENIMAGEIO=ON -D OPENIMAGEIO_ROOT_DIR=/opt/lib/oiio -D WITH_CYCLES_OSL=OFF -D WITH_LLVM=OFF -D WITH_OPENSUBDIV=ON -D OPENSUBDIV_ROOT_DIR=/opt/lib/osd -D WITH_OPENVDB=ON -D WITH_OPENVDB_BLOSC=ON -D WITH_OPENCOLLADA=ON -D WITH_CODEC_FFMPEG=ON -D FFMPEG_LIBRARIES='avformat;avcodec;avutil;avdevice;swscale;swresample;lzma;rt;theoradec;theora;theoraenc;vorbisenc;vorbisfile;vorbis;ogg;xvidcore;vpx;mp3lame;x264;openjpeg;openjpeg_JPWL'"

	cd ../build_linux
	sudo make install
	#compilando el codigo comandos

	for ((espacio=0; espacio<3;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#spa_txt_exito}+$COLUMNS)/2)) "$spa_txt_exito"
	printf "%*s\n" $(((${#spa_txt_presione_ent}+$COLUMNS)/2)) "$spa_txt_presione_ent"
	read key "enter"
	#Compiling source code commands

	#finishing and copyright
	clear
	for ((espacio=0; espacio<7;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#spa_da1}+$COLUMNS)/2)) "$spa_da1"
	printf "%*s\n" $(((${#spa_da2}+$COLUMNS)/2)) "$spa_da2"
	printf "%*s\n" $(((${#spa_da3}+$COLUMNS)/2)) "$spa_da3"
	printf "%*s\n" $(((${#spa_da4}+$COLUMNS)/2)) "$spa_da4"
	printf "%*s\n" $(((${#spa_da5}+$COLUMNS)/2)) "$spa_da5"
	printf "%*s\n" $(((${#spa_da6}+$COLUMNS)/2)) "$spa_da6"
	printf "%*s\n" $(((${#spa_txt_gracias}+$COLUMNS)/2)) "$spa_txt_gracias"
	printf "%*s\n" $(((${#spa_txt_presione_ent}+$COLUMNS)/2)) "$spa_txt_presione_ent"
	read key "enter"
	;;
		
	#menu null
	*)
	for ((espacio=0; espacio<11;espacio++)) do echo "" 
	done
	printf "%*s\n" $(((${#inv_option_txt}+$COLUMNS)/2)) "$inv_option_txt"
	sleep 4
	;;

esac





