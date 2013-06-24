package modulesAndPopups.commons.utils
{
    public function generateUID():Number
    {
        var low:Number = 1;
        var high:Number = 100;
        var result:Number = Math.floor(Math.random() * (1 + high - low)) + low;
        return result;
    }
}
