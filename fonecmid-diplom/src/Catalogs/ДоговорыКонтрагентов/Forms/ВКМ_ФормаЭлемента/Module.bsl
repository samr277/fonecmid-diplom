#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Объект.ВидДоговора = ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание") Тогда
		Элементы.РеквизитыАбонентскогоДоговора.Видимость = Истина;
	Иначе
		Элементы.РеквизитыАбонентскогоДоговора.Видимость = Ложь;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	Если Объект.ВидДоговора = ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.Покупатель") ИЛИ
	Объект.ВидДоговора = ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.Поставщик") Тогда
		Объект.ВКМ_ДатаЗавершения = "01010001000000"; 
		Объект.ВКМ_СтоимостьЧасаРаботы = 0;
		Объект.ВКМ_СуммаАбонентскойПлаты = 0;
	ИначеЕсли Объект.ВидДоговора = ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание") Тогда
		Если Объект.ВКМ_ДатаЗавершения < Объект.ВКМ_ДатаНачала Тогда
			Отказ = Истина;
			Сообщение = Новый СообщениеПользователю;
			Сообщение.Текст = "Дата завершения действия договора не может быть раньше даты заключения договора!";
			Сообщение.Поле = "Объект.ВКМ_ДатаЗавершения";
			Сообщение.Сообщить();
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

#КонецОбласти


#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ВидДоговораПриИзменении(Элемент)
	Если Объект.ВидДоговора = ПредопределенноеЗначение("Перечисление.ВидыДоговоровКонтрагентов.ВКМ_АбонентскоеОбслуживание") Тогда
		Элементы.РеквизитыАбонентскогоДоговора.Видимость = Истина;
	Иначе
		Элементы.РеквизитыАбонентскогоДоговора.Видимость = Ложь;		
	КонецЕсли;
КонецПроцедуры

#КонецОбласти