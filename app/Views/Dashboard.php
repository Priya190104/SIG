<?php 
echo view('header');  // memanggil file view header.php
echo view('sidebar'); // memanggil file view sidebar.php
?>
<main class="col-10 ms-sm-auto px-md-4">
<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items center pt-3pb-2">
<h1 class="h4">Dashboard</h1>
</div>
<div class="row">
<div class="col-9 d-flex">
<div id="map" class="flex-grow" style="width: 1200px;height: 750px;"></div>
<div id="map"></div>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script src="path/to/data.js"></script>
    <script>
        // Inisialisasi peta
        var map = L.map('map').setView([-7.699001787484193, 109.0248019101731], 12);

        // Tambahkan tile layer
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);
        
        const polygon = L.polygon([
		[108.63801578200007, -7.1416791909999775],
		[108.63772586700006, -7.14143790199990806],
		[108.63742069500003, -7.141257665999917],
        
	]).addTo(map).bindPopup('I am a polygon.');
        // Tambahkan GeoJSON layer ke peta
       fetch('data.geojson')
            .then(response => response.json())
            .then(data => {
                // Tambahkan GeoJSON layer ke peta
                L.geoJSON(data, {
                    style: function (feature) {
                        return { color: 'blue' };
                    },
                    onEachFeature: function (feature, layer) {
                        layer.bindPopup(feature.properties.name);
                    }
                }).addTo(map);
            })
            .catch(error => console.error('Error loading the GeoJSON file:', error));
        
    </script>
<!-- file json poligon kecamatan-->
<script type="text/javascript" src="<?php echo'public/uploads/'.$kabupaten->kode_kabupaten.'.json';?>"></script>
<script>
// AJAX function untuk mengambil data per kecamatan
function getData(kode_kecamatan){
$.ajax({
url: '<?php echo site_url('getdata'); ?>',
type: 'GET',
data: {kode_kecamatan: kode_kecamatan},
success: function(response){
var obj = JSON.stringify(response);
var res = JSON.parse(obj);
$('#tableBody').html(res.hasil);
}
});
}
// koordinat kabupaten
var coordinate = [<?php echo $kabupaten->koordinat;?>];
var zoomLevel = 12;
var map = new L.map('map').setView(coordinate,zoomLevel);
var layer = new L.TileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);
function onEachFeature(feature, layer) {
layer.on('click', function (e) {
// kode kecamatan diambil dari file geojson
let kode = e.target.feature.properties.Code; 
       
        
// memanggil AJAX function getdata() untuk
// mengambil data dari tabel kecamatan
       
// sesuai kode kecamatan
getData(kode);
});
var label = L.marker(layer.getBounds().getCenter(), {
icon: L.divIcon({
className: 'text-danger fw-bold',
html: feature.properties.Name,
iconSize: [100, 10]
})
}).addTo(map);
}
// function untuk mengatur style CSS polygon
function style(feature) {
return {
fillColor: '#FFEDA0',  // warna polygon
weight: 2,
opacity: 1,
color: '#FEB24C', // warna garis batas polygon
dashArray: '3',
fillOpacity: 0.7
};
}
const geojson = new L.geoJson(kecamatan,{
style:style,  // warna polygon kuning
    onEachFeature: onEachFeature
}).addTo(map);
// data marker yang dikirim dari controller
// ditampung pada variabel lokasi
var lokasi = [<?php echo $marker;?>];
// perulangan sebanyak data marker yang ada di tabel sekolah
for (var i = 0; i < lokasi.length; i++) {
let marker_label = 'NPSN: '+lokasi[i]
[0]+'<br>'+lokasi[i][1]+'<br>'+lokasi[i][2]+'<br>STATUS: '+lokasi[i][3]+' '+lokasi[i][4];
marker = new L.marker([lokasi[i][5], lokasi[i][6]]).addTo(map).bindPopup(marker_label);


}
</script>
</div>
<div class="col-3">
<div class="card">
<div class="card-header bg-primary text-light">Statistik</div>
<div class="card-body">
<table class="table table-borderless">
<tbody id="tableBody">
<tr>
<td>Kabupaten</td>
<td>:</td>
<td><?php echo $kabupaten->nama_kabupaten;?></td>
</tr>
<tr>
<td>Luas Wilayah</td>
<td>:</td>
<td><?php echo 
number_format($kabupaten->luas_wilayah,0,',','.').' km<sup>2</sup>'; ?></td>
</tr>
<tr>
<td>Jumlah Penduduk</td>
<td>:</td>
<td><?php echo number_format($kabupaten->jumlah_penduduk,0,',','.').' Jiwa' ?></td>
</tr>
</tbody>
</table>
</div>
<div class="card-footer small bg-primary text-light">
Sumber : BPS 2022
</div>
</div>
</div>
</div>
</main>
<?php
echo view('footer'); // memanggil file view footer.php
?>