<?php

namespace App\Imports;

use App\Models\Gfs;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class CsvImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Gfs([
            'gfs_code'     => $row[0],
            'gfs_desc'    => $row[1],
            'unit'     => $row[2],
        ]);
    }
}
