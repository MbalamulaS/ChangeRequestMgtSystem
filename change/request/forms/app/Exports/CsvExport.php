<?php

namespace App\Exports;

use App\Models\Gfs;
use Maatwebsite\Excel\Concerns\FromCollection;

class CsvExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Gfs::all();
    }
}
