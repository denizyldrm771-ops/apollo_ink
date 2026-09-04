APOLLO INK V17 — HESAP & BULUT

1) Supabase'te yeni bir proje oluştur.
2) SQL Editor'a cloud.sql dosyasının tamamını yapıştırıp çalıştır.
3) Supabase Project URL ve Publishable Key değerlerini config.js içine yaz.
4) index.html + config.js + cloud.sql + diğer V16 dosyalarını GitHub Pages'e yükle.
5) Profil > Hesap & Bulut bölümünden hesap oluştur/giriş yap.

Not: config.js içindeki anahtar publishable/anon anahtar olmalıdır. service_role/secret key kullanma.

V17 yerel veriyi apolloInkData anahtarıyla korur. Hesap bağlandığında bulut verisi aynı hesapla iPhone/iPad gibi cihazlar arasında senkronlanır. Her kullanıcı yalnızca kendi user_id kaydını görür (RLS).
