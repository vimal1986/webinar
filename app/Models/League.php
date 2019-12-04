<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use League\Flysystem\Exception;


class League extends Model
{
    public $active;
    protected $table = 'leagues';
    protected $fillable = ['league_name'];

    public static function getActiveLeagues()
    {
        try{
            return self::select('id', 'league_name')
                ->whereNull('leagues.deleted_at')->orderBy('leagues.league_name', 'ASC')
                ->get();
        } catch (Exception $e){

        }
    }
    /*protected $with = [
        'requests'
    ];*/
    /*public function requests()
    {
        return $this->hasMany('App\Models\ServiceRequest', 'region')->where('status','Open');
    }
    public static function active()
    {
        return self::query()->where('is_active', 1);
    }
    public function getActiveRegions()
    {
        return self::active()->get();
    }*/
}