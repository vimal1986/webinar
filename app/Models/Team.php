<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use League\Flysystem\Exception;


class Team extends Model
{
    public $active;
    protected $table = 'teams';
    protected $fillable = ['league_id', 'logo_location', 'team_member', 'region'];

    public static function getActiveTeams()
    {
        try{
            return self::select('id', 'league_id', 'logo_location', 'team_member', 'region')
                ->whereNull('teams.deleted_at')->orderBy('teams.team_name', 'ASC')->leagues()
                ->get();
        } catch (Exception $e){

        }
    }

    public function leagues()
    {
        return $this->belongsTo('App\Models\League');
    }
}