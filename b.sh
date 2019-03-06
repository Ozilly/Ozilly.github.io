while true; do
    read -p "Синхронизировать исходники? " yn
    case $yn in
        [Yy]* ) 
		repo sync -c -j16 --force-sync --no-clone-bundle --no-tags;
		rm -R hardware/qcom/fm;
		rm -R external/ntfs-3g;
		rm -R packages/inputmethods;
		rm -R hardware/qcom/display-caf;
		rm -R packages/apps/Calendar;
		rm -R packages/apps/Contacts;
		rm -R packages/apps/DeskClock;
		rm -R packages/apps/ExactCalculator;
		rm -R packages/apps/FMRadio;
		rm -R packages/apps/Messaging;
		rm -R packages/apps/SnapdragonCamera2;
		rm -R packages/apps/Launcher3;
		rm -R packages/apps/Launcher2;
		rm -R packages/apps/Camera2;
		mkdir hardware/qcom/fm;
		mkdir hardware/qcom/display-caf;
		cp -R /home/Shinigami890/builds/src/hals/display-caf/* hardware/qcom/display-caf;
		cp -R /home/Shinigami890/builds/src/fm/fm/* hardware/qcom/fm;
		mkdir external/ntfs-3g;
		cp -R /home/Shinigami890/builds/src/ntfs-3g/* external/ntfs-3g;
		mkdir packages/apps/FMRadio;
		cp -R /home/Shinigami890/builds/src/fm/FMRadio/* packages/apps/FMRadio;
		
while true; do
		read -p "Синхронизация завершена, запустить сборку? " yn
		case $yn in
        [Yy]* ) 
		echo    "Начинаю сборку...";
		source build/envsetup.sh && lunch baikalos_X00TD-userdebug;
		
		make -j16 otapackage;
		
while true; do
		read -p "Сборка завершена, выгрузить на ГУГЛ ДИСК? " yn
		case $yn in
        [Yy]* ) 
		echo    "Выгружаю...";
		cd out/target/product/X00TD;
		rm -r *.md5sum;
		linkk=$(ls -t | grep zip | head -1);
		sudo gdrive upload $linkk;
		cd /home/Shinigami890/builds/syberia;
		exit;;
        [Nn]* ) 
		echo    "Ну нет так нет!";
		exit;;
        * ) echo "Введите да или нет";;
    esac
done
		
		break;;
        [Nn]* ) 
		echo    "Ну нет так нет!";
		exit;;
        * ) echo "Введите ДА или НЕТ";;
    esac
done;;
        [Nn]* ) 
		echo "Начинаю сборку без синхронизации...";
		source build/envsetup.sh && lunch baikalos_X00TD-userdebug;
		
		make -j16 otapackage
		exit;;
        * ) echo "Введите да или нет";;
    esac
done


