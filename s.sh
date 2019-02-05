while true; do
    read -p "Синхронизировать исходники? " yn
    case $yn in
        [Yy]* ) 
		repo sync -c -j10 --force-sync --no-clone-bundle --no-tags;
		rm -R hardware/qcom/fm;
		rm -R vendor/miui;
		rm -R hardware/qcom/display-caf;
		rm -R external/ntfs-3g;
		rm -R packages/inputmethods;
		rm -R packages/apps/FMRadio;
		rm -R packages/apps/Messaging;
		rm -R packages/apps/Snap;
		rm -R packages/apps/Launcher3;
		mkdir hardware/qcom/fm
		cp -R /home/Shinigami890/builds/src/fm/fm/* hardware/qcom/fm;
		mkdir hardware/qcom/display-caf;
		cp -R /home/Shinigami890/builds/src/hals/display-caf/* hardware/qcom/display-caf;
		mkdir external/ntfs-3g;
		cp -R /home/Shinigami890/builds/src/ntfs-3g/* external/ntfs-3g;
		mkdir packages/apps/FMRadio;
		cp -R /home/Shinigami890/builds/src/fm/FMRadio/* packages/apps/FMRadio;
		
while true; do
		read -p "Синхронизация завершена, запустить сборку? " yn
		case $yn in
        [Yy]* ) 
		echo    "Начинаю сборку...";
		source build/envsetup.sh && lunch syberia_X00T-userdebug;
		
		mka bacon -j10;
		
while true; do
		read -p "Сборка завершена, выгрузить на ГУГЛ ДИСК? " yn
		case $yn in
        [Yy]* ) 
		echo    "Выгружаю...";
		cd out/target/product/X00T;
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
		source build/envsetup.sh && lunch sybera_X00T-userdebug;
		
		mka bacon -j10
		exit;;
        * ) echo "Введите да или нет";;
    esac
done


