while true; do
    read -p "Синхронизировать исходники? " yn
    case $yn in
        [Yy]* ) 
		rm -R vendor/superior/prebuilt/common/apk/Android.mk;
		repo sync -c -j8 --force-sync --no-clone-bundle --no-tags;
		rm -R hardware/qcom/fm;
		rm -R hardware/qcom/display-caf;
		rm -R external/ntfs-3g;
		rm -R packages/inputmethods;
		rm -R packages/apps/FMRadio;
		rm -R packages/apps/Messaging;
		rm -R packages/apps/Snap;
		rm -R vendor/superior/prebuilt/app/Browser;
		rm -R vendor/qcom/opensource/data-ipa-cfg-mgr;
		mkdir hardware/qcom/fm
		cp -R /home/Shinigami890/builds/src/fm/fm/* hardware/qcom/fm;
		mkdir hardware/qcom/display-caf;
		cp -R /home/Shinigami890/builds/src/hals/display-caf/* hardware/qcom/display-caf;
		mkdir external/ntfs-3g;
		cp -R /home/Shinigami890/builds/src/ntfs-3g/* external/ntfs-3g;
		mkdir packages/apps/FMRadio;
		cp -R /home/Shinigami890/builds/src/fm/FMRadio/* packages/apps/FMRadio;
		cp -R /home/Shinigami890/builds/src/translate/Settings/values-ru/* packages/apps/Settings/res/values-ru;
		if ! [ -d packages/apps/SmartNavSettings/res/values-ru ]; then
		mkdir packages/apps/SmartNavSettings/res/values-ru
		fi
		cp -R /home/Shinigami890/builds/src/translate/SmartNavSettings/values-ru/* packages/apps/SmartNavSettings/res/values-ru;
		cp -R /home/Shinigami890/builds/src/translate/SuperiorSettings/* packages/apps/SuperiorSettings/res/values-ru;
		cp -R /home/Shinigami890/builds/src/system/media/* vendor/superior/prebuilt/common/bootanimation;
		cp -R /home/Shinigami890/builds/src/system/app/AsusCamera/* vendor/superior/prebuilt/common/apk;
		cp -R /home/Shinigami890/builds/src/system/app/Gboard/* vendor/superior/prebuilt/common/apk;
		cp -R /home/Shinigami890/builds/src/system/app/MagiskManager/* vendor/superior/prebuilt/common/apk;
		cp -R /home/Shinigami890/builds/src/system/app/MicroG/* vendor/superior/prebuilt/common/apk;
		cp -R /home/Shinigami890/builds/src/system/app/MixExplorer/* vendor/superior/prebuilt/common/apk;
		cp -R /home/Shinigami890/builds/src/system/app/YouTube-red/* vendor/superior/prebuilt/common/apk;
		cp -R /home/Shinigami890/builds/src/system/app/android-sms/* vendor/superior/prebuilt/common/apk;
		cat /home/Shinigami890/builds/src/system/app/CustomApp.mk >> vendor/superior/prebuilt/common/apk/Android.mk;
		
while true; do
		read -p "Синхронизация завершена, запустить сборку? " yn
		case $yn in
        [Yy]* ) 
		echo    "Начинаю сборку...";
		source build/envsetup.sh && lunch superior_X00TD-userdebug;
		make installclean;
		mka bacon -j8;
		
while true; do
		read -p "Сборка завершена, выгрузить на ГУГЛ ДИСК? " yn
		case $yn in
        [Yy]* ) 
		echo    "Выгружаю...";
		cd out/target/product/X00TD;
		rm -r *.md5sum;
		linkk=$(ls -t | grep zip | head -1);
		sudo gdrive upload $linkk;
		cd /home/Shinigami890/builds/super;
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
		source build/envsetup.sh && lunch superior_X00TD-userdebug;
		make installclean;
		mka bacon -j8
		exit;;
        * ) echo "Введите да или нет";;
    esac
done


