<?php

namespace Shopware\Themes\Hansecraft;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
Hansecraft Template
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
Alexander Peschel
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'
MIT
SHOPWARE_EOD;

    protected $javascript = [
      'src/js/jquery.shopware-responsive.js'
    ];

    public function createConfig(Form\Container\TabContainer $container)
    {
    }
}
