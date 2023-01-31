<!DOCTYPE html>
<html lang="en">

<head>
	<title>CETAK SURAT</title>
</head>
<style>
	h3,
	h5 {
		margin-top: -20px;
	}

	img {
		margin-right: 500px;
		display: inline-block
	}
</style>

<body>
	<center>

		<h2>PEMERINTAH KABUPATEN TANAH DATAR</h2>
		<!-- <img src="<?= base_url('assets') ?>/img/logo.png" style="margi;width:65px;height:65px;"> -->
		<h3>BATIPUAH SELATAN
			<br>NAGARI GUGUAK MALALO

		</h3>
		<h3>________________________________________________________________________</h3>

	</center>

	<center>
		<h4>
			<u>SURAT KETERANGAN USAHA</u>
		</h4>
		<h4>Nomor :
			<?php echo $cetaksurat['kode_surat']; ?> / <?php echo $cetaksurat['no_surat']; ?>
		</h4>
	</center>
	<p>Yang bertandatangan dibawah ini, menerangkan bahwa :</P>
	<table>
		<tbody>
			<tr>
				<td>NIK</td>
				<td>:</td>
				<td>
					<?php echo $cetaksurat['nik']; ?>
				</td>
			</tr>
			<tr>
				<td>Nama</td>
				<td>:</td>
				<td>
					<?php echo $cetaksurat['nm_lengkap']; ?>
				</td>
			</tr>
			<tr>
				<td>Tempat tgl/lahir</td>
				<td>:</td>
				<td>
					<?php echo $cetaksurat['tmpt_lahir']; ?>,<?php echo $cetaksurat['tgl_lahir']; ?>
				</td>
			</tr>
			<tr>
				<td>Jenis Kelamin</td>
				<td>:</td>
				<td>
					<?php echo $cetaksurat['jk']; ?>

				</td>
			</tr>
			<tr>
				<td>Pekerjaan</td>
				<td>:</td>
				<td>
					<?php echo $cetaksurat['pekerjaan']; ?>

				</td>
			</tr>
			</tr>
			<tr>
				<td>Keterangan</td>
				<td>:</td>
				<td>
					<?php echo $cetaksurat['keterangan']; ?>

				</td>
			</tr>

		</tbody>
	</table>
	<br>
	<!-- <p>Orang tersebut diatas benar-benar mempunyai usaha :</p> -->
	<center>
		<table>
			<tbody>
				<tr>
					<td>Nama Usaha</td>
					<td>:</td>
					<td>
						<?php echo $cetaksurat['nm_usaha']; ?>
					</td>
				</tr>
				<tr>
					<td>Jenis Usaha</td>
					<td>:</td>
					<td>
						<?php echo $cetaksurat['jenis_usaha']; ?>
					</td>
				</tr>
				<tr>
					<td>Alamat Usaha</td>
					<td>:</td>
					<td>
						<?php echo $cetaksurat['alamat_usaha']; ?>
					</td>
				</tr>
				<tr>
					<td>Berlaku</td>
					<td>:</td>
					<td>
						<?php echo $cetaksurat['tanggal']; ?>
					</td>
				</tr>

			</tbody>
		</table>
	</center>
	<p>Demikian atas perhatian dan kerjasamanya kami ucapkan terima kasih.</P>
	<br>
	<br>
	<br>
	<br>
	<br>
	<p align="right">
		Guguak Malalo, <?php echo $cetaksurat['tanggal']; ?>
		<br> a/n Wali Nagari Guguak Malalo
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>(SUYONORIZAL AMBRI)
	</p>


	<script type="text/javascript">
		window.print();
	</script>

</body>

</html>
