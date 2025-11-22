> [🇬🇧 English](README.md) | 🇹🇷 Türkçe

# HandBrake Batch Compressor (HBC) – Türkçe

HBC, **HandBrakeCLI** kullanarak video klasörlerini toplu şekilde sıkıştıran küçük ama odaklı bir macOS aracıdır – tek klasör, tek tık, kuyrukla uğraşma derdi yok.

Uygulama, seçtiğin kaynak klasörü (ve tüm alt klasörlerini) özyinelemeli olarak tarar, desteklenen video dosyalarını bulur ve basit, minimal bir arayüzle HandBrakeCLI üzerinden encode eder. Tasarımın odağı:

- 🖱️ **Tek tıkla kullanım** – bir klasör seç, **Start**’a bas, gerisini uygulama halletsin.
- 📁 **Klasör farkındalığı** – iç içe geçmiş derin klasör yapılarıyla rahatça çalışır; dosyaları tek tek taşıman gerekmez.
- 🧠 **Varsayılan olarak güvenli** – orijinal dosyalara dokunmak için özellikle senin onayın gerekir; yıkıcı işlemler asla “kazara” çalışmaz.
- 🌍 **Çoklu dil desteği** – arayüz, dünyanın en yaygın konuşulan dillerinden bazılarını yerel olarak destekler.

> **Not:** HBC, tamamen bağımsız ve resmi olmayan bir projedir. HandBrake ekibiyle herhangi bir resmi bağı yoktur.  
> Video encode işinin asıl tüm emeği, harika [HandBrake](https://handbrake.fr/) projesine ve katkıda bulunanlara aittir.

---

## Demo

Bu depo içerisinde `DemoVideo.mp4` isminde kısa bir demo videosu bulunur.

https://github.com/user-attachments/assets/363d9826-3db1-46ae-b82e-f661e34280e3

Demo kısaca şunları gösterir:
- HBC’nin başlatılması,
- Video dosyaları içeren bir kaynak klasörün seçilmesi,
- Varsayılan ayarlarla bir batch işleminin başlatılması,
- Dosyalar işlenirken ilerleme ve durum bilgilerinin izlenmesi,
- İşlem tamamlandıktan sonra oluşturulan sıkıştırılmış klasörün gözden geçirilmesi.

---

## Özellikler

- 🔍 **Özyinelemeli klasör taraması (recursive scan)**
  - Bir kaynak klasör seçtiğinde HBC, o klasörü ve tüm alt klasörleri tarayarak desteklenen video dosyalarını otomatik olarak bulur.

- 🎬 **HandBrakeCLI ile toplu video encode**
  - Motor olarak HandBrake’in komut satırı arayüzü (HandBrakeCLI) kullanılır.
  - Arayüz üzerinden encoder, kalite, kare hızı (framerate) ve ek parametreleri pratik şekilde ayarlamana izin verir.

- 🧯 **Güvenli mod (YOLO kapalıyken)**
  - Encode edilmiş dosyalar ayrı bir “compressed” klasöre yazılır.
  - Orijinal klasör yapısı ve dosyalar aynen korunur; hiçbir şeyin üzerine yazılmaz.

- ⚠️ **YOLO Modu (yıkıcı, isteğe bağlı)**
  - YOLO açıkken HBC, her yeni encode edilen dosyayı orijinaliyle karşılaştırır:
    - Yeni dosya **daha küçükse**, orijinal silinir ve yerine yenisi konur.
    - Yeni dosya **daha büyükse** veya encode işlemi başarısız olmuşsa, orijinal dosya korunur.
  - Bu mod **yıkıcıdır** ve geri alınamaz – YOLO’yu açarken uygulama net bir uyarı gösterir ve senden onay ister.

- 🧹 **Orijinal klasörü optimize et (Optimize Original Folder)** – güvenli akışlar için
  - YOLO **kapalıyken** encode işlemi bittikten sonra, HBC tüm encode edilmiş dosyaları ayrı bir sıkıştırılmış klasöre yazar.
  - **Optimize Original Folder** komutu:
    - Bu sıkıştırılmış klasörü tarar,
    - Kaynak klasördeki eşleşen orijinal dosyaları bulur,
    - Sıkıştırılmış dosya daha küçükse, orijinali onunla değiştirir,
    - Daha büyük veya aynı boyuttaki sıkıştırılmış dosyaları atlar.
  - Böylece önce sonuçları sıkıştırılmış klasörde inceleyebilir, sonra beğendiğin küçültmeleri orijinal klasör yapına güvenle uygulayabilirsin.

- 📝 **İsteğe bağlı çalışma log’u**
  - İstersen, her çalıştırma için seçilen kaynak klasörün içine bir log dosyası kaydedebilirsin.
  - Log; başarılı işlemleri, atlanan dosyaları, boyut karşılaştırmalarını ve hata mesajlarını açıkça kayıt altına alır.

- 🧩 **Bilgi ve yardım pencereleri**
  - Uygulama içinde:
    - **YOLO Mode**’un tam olarak ne yaptığını ve neden riskli olduğunu,
    - **Optimize Original Folder**’ın nasıl çalıştığını ve hangi senaryolarda mantıklı olduğunu
      anlatan bilgi sheet’leri bulunur.
  - Ayrı bir **“How to install HandBrake”** sheet’i de Homebrew ve HandBrakeCLI kurulumunu adım adım açıklar; kopyalanabilir komutlar ve basit bir kurulum testi sunar.

- 🌐 **Dil desteği**
  - Arayüz, ister sistem dilini takip eder, ister Ayarlar ekranından yalnızca uygulama için geçerli olacak özel bir dili seçmeni sağlar.
  - Şu anda desteklenen diller arasında şunlar yer alır:
    - English  
    - Turkish  
    - Spanish  
    - French  
    - German  
    - Portuguese  
    - Russian  
    - Japanese  
    - Korean  
    - Hindi  
    - Bengali  
    - Vietnamese  
    - Italian  
    - Tamil  
    - Telugu  
    - Marathi  
    - Javanese  
  - Herhangi bir anahtar (key) için çeviri eksikse, HBC o metin için otomatik olarak İngilizce’ye geri döner (fallback).

---

## Gereksinimler

- Güncel bir **macOS** sürümü (modern SwiftUI / Sonoma dönemi API’leri).  
  Daha eski bir sistemi hedefliyorsan, Xcode projesindeki deployment target değerini kontrol et.
- Sisteminde yüklü ve erişilebilir bir [HandBrakeCLI](https://handbrake.fr/).
- (Opsiyonel ama önerilir) [Homebrew](https://brew.sh/) – HandBrakeCLI’yi kolayca kurmak için.

HBC, tamamen native bir SwiftUI macOS uygulamasıdır ve **HandBrakeCLI’yi kendi içinde barındırmaz** – HandBrakeCLI’yi ayrıca kurman gerekir.

---

## HandBrakeCLI Kurulumu

HBC, `HandBrakeCLI`’nin PATH üzerinde veya yaygın kullanılan konumlardan birinde (örneğin `/usr/local/bin/HandBrakeCLI`) bulunmasını bekler.  
Uygulama içinde “How to install HandBrake” sheet’i de yer alır, ancak hızlı bir özet vermek gerekirse:

### 1. Homebrew kurulumu (henüz yoksa)

En güncel kurulum talimatları için [Homebrew sitesini](https://brew.sh/) ziyaret et.  
Genellikle aşağıdaki komuta benzer bir komutla kurulum yapılır:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Homebrew ile HandBrakeCLI kurulumu

```bash
brew install handbrake
```

Bu komut, HandBrake’in komut satırı sürümünü (HandBrakeCLI) kurar ve HBC’nin genellikle otomatik olarak algılayabildiği bir konuma yerleştirir.

### 3. Özel HandBrakeCLI yolu (opsiyonel)

`HandBrakeCLI`’yi elle veya standart dışı bir konuma kurduysan:

- HBC içinde **Settings** ekranını aç,
- `HandBrakeCLI` ikili dosyasının (binary) tam yolunu gir,
- **Check** düğmesine basarak HBC’nin bu yolu kullanabildiğini doğrula.

---

## HBC Kurulumu (uygulama)

HBC’yi çalıştırmanın iki yaygın yolu vardır:

### Hazır derleme (normal kullanıcılar için önerilen)

1. En güncel sürümü [Releases](https://github.com/kemalsanli/HBC/releases) sayfasından indir,
2. `HBC.app` (veya benzer isimli uygulama paketi) dosyasını `/Applications` klasörüne taşı,
3. Uygulamayı Launchpad veya Finder üzerinden başlat.

> Eğer macOS Gatekeeper, kimliği tanınmayan geliştirici uyarısı verirse, uygulamaya sağ tıklayıp bir kez **Open** diyerek onaylaman gerekebilir.

### Kaynaktan derleme (geliştiriciler için)

1. Depoyu klonla:

   ```bash
   git clone https://github.com/kemalsanli/HBC.git
   cd HBC
   ```

2. Projeyi Xcode ile aç:

   ```bash
   open HBC.xcodeproj
   ```

   (Eğer workspace kullanıyorsan ilgili workspace dosyasını aç.)

3. **HBC** hedefini seçip **My Mac** üzerinde çalıştır (`⌘R`).

HandBrakeCLI’nin, önceki bölümde anlatıldığı şekilde kurulmuş ve erişilebilir olduğundan emin ol.

---

## Kullanım

Tipik bir kullanım akışı şöyle:

1. **HBC’yi başlat.**
2. **Select Source Folder** düğmesine tıklayıp videolarını içeren klasörü seç.
3. Gerekirse encoder, kalite, kare hızı ve ek parametreleri ayarla.
4. (İsteğe bağlı) Şu seçenekleri etkinleştirebilirsin:
   - **Save run log in source folder**
   - **YOLO Mode** (risklerini anlıyor ve kabul ediyorsan)
5. Batch işlemini başlatmak için **Start**’a bas.
6. Her dosya işlenirken ilerleme göstergelerini ve durum mesajlarını takip et.
7. İşlem tamamlandığında:
   - YOLO **kapalıysa**:
     - HBC’nin oluşturduğu sıkıştırılmış klasörü incele,
     - Sonuçtan memnunsan, **Optimize Original Folder** komutu ile yalnızca daha küçük olan sıkıştırılmış dosyalarla orijinalleri değiştir.
   - YOLO **açıksa**:
     - Encode süreci boyunca bazı orijinal dosyalar zaten daha küçük sürümlerle değiştirilmiş olabilir.

İstediğin zaman:

- Genel bir özet için **Help / About** sheet’ini açabilirsin,
- **YOLO Mode** ve **Optimize Original Folder** bilgi sheet’lerini kullanarak bu işlemlerin tam olarak ne yaptığını tekrar okuyabilirsin,
- Kurulum veya sorun giderme için **How to install HandBrake** sheet’ine göz atabilirsin.

---

## Hata Yönetimi ve Loglar

- HBC, uygun durumlarda macOS uyarı pencereleri (alert) gösterir (örneğin hiç video dosyası bulunamadığında veya HandBrakeCLI çalıştırılamadığında).
- **Save run log** seçeneği açıksa, seçtiğin kaynak klasörün içine bir log dosyası oluşturulur:
  - İşlenen her dosya ve boyut karşılaştırması,
  - HandBrakeCLI’nin rapor ettiği encode hataları,
  - YOLO Mode veya Optimize Original Folder tarafından alınan kararlar
    bu log’da yer alır.

Bu loglar, hem sorun gidermek hem de uzun bir batch çalışmasının tam olarak ne yaptığını görmek için oldukça faydalıdır.

---

## Yerelleştirme

HBC, hafif ama esnek bir yerelleştirme sistemi kullanır:

- Tüm kullanıcıya gösterilen metinler dahili bir `L10nKey` enum’u ile anahtarlanır,
- Her dil, bu anahtarları kendi çevirilerine eşleyen bir sözlük içerir,
- Bir dil / anahtar çifti için çeviri eksikse, HBC otomatik olarak İngilizce’ye döner (fallback),
- Ayarlar ekranından:
  - Sistem dilini (`System`) kullanmayı seçebilir,
  - Ya da yalnızca uygulama için geçerli olacak belirli bir dili zorlayabilirsin.

Çevirileri geliştirmek veya yeni diller eklemek istersen, katkılarını memnuniyetle karşılarız (aşağıya bak).

---

## Katkıda Bulunma

Katkılar, hata raporları ve yeni özellik istekleri memnuniyetle kabul edilir.

- Hata bildirmek, özellik önermek veya fikir tartışmak için [GitHub Issues](https://github.com/kemalsanli/HBC/issues) bölümünü kullanabilirsin.
- Pull Request (PR) göndermek istersen:
  - Kod tabanını iyileştirebilir,
  - Hata veya edge case’leri düzeltebilir,
  - Kendi dilinde çeviri ekleyebilir veya mevcut çevirileri iyileştirebilir,
  - Dokümantasyonu ve README’yi geliştirebilirsin.

PR göndermeden önce:

- Değişikliklerini mümkün olduğunca odaklı ve iyi kapsüllenmiş tut,
- Gelecekteki okuyuculara yardımcı olacak yerlerde dokümantasyon / yorum satırlarını güncelle,
- En az bir dilde ve basit bir batch koşusuyla değişikliklerini macOS üzerinde test et.

---

## Teşekkür

Bu proje, aşağıdakiler olmasa pek anlamlı olmazdı:

- **[HandBrake](https://handbrake.fr/)** – tüm ağır işi yapan güçlü ve açık kaynaklı encode motoru (HandBrakeCLI),
- macOS geliştirmeyi daha keyifli hale getiren geniş açık kaynak ekosistemi ve topluluk.

HBC, HandBrakeCLI etrafında, macOS için odaklı ve kullanıcı dostu bir toplu video sıkıştırma arayüzü sunmayı amaçlar.

---

## Lisans

Bu depo açık kaynaklıdır.  
Tam lisans detayları için lütfen depodaki [`LICENSE`](./LICENSE) dosyasına bak.
