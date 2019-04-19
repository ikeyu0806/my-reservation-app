# README

簡易予約アプリケーション

メモ

とりあえず候補日と除外日はコンソールから入れる
```

AppointmentDate.create!(to_date: '2019-05-01 00:00:00', from_date: '2019-04-01 00:00:00')
```

```

ExcludedDate.create!(excluded_date: '2019-04-15 00:00:00', appointment_date_id: 1)
```