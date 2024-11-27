program HitungBilangan;

uses crt;

function isPrime(n: Integer): Boolean;
var
  i: Integer;
begin
  if n <= 1 then
    isPrime := False
  else
  begin
    isPrime := True;
    for i := 2 to Trunc(Sqrt(n)) do
    begin
      if (n mod i = 0) then
      begin
        isPrime := False;
        Break;
      end;
    end;
  end;
end;

var
  numbers: array of Integer;
  num, primeCount, evenCount, oddCount, i: Integer;
begin
  clrscr;

  // Membaca input bilangan
  Write('Masukkan serangkaian bilangan bulat (pisahkan dengan spasi, akhiri dengan 0): ');
  
  // Menyimpan input ke dalam array
  SetLength(numbers, 0);  // Inisialisasi array kosong
  repeat
    Read(num);
    if num <> 0 then
    begin
      SetLength(numbers, Length(numbers) + 1);
      numbers[High(numbers)] := num;
    end;
  until num = 0;

  // Inisialisasi penghitung
  primeCount := 0;
  evenCount := 0;
  oddCount := 0;

  // Proses setiap bilangan dalam array
  for i := 0 to High(numbers) do
  begin
    if isPrime(numbers[i]) then
    begin
      primeCount := primeCount + 1;
      Write(numbers[i], ' ');
    end;

    if numbers[i] mod 2 = 0 then
      evenCount := evenCount + 1
    else
      oddCount := oddCount + 1;
  end;

  // Menampilkan hasil
  WriteLn;
  WriteLn('Jumlah bilangan prima: ', primeCount);
  WriteLn('Jumlah bilangan genap: ', evenCount);
  WriteLn('Jumlah bilangan ganjil: ', oddCount);

  ReadLn;
end.
