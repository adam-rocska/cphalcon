<?php
declare(strict_types=1);

/**
 * This file is part of the Phalcon Framework.
 *
 * (c) Phalcon Team <team@phalcon.io>
 *
 * For the full copyright and license information, please view the LICENSE.txt
 * file that was distributed with this source code.
 */

namespace Phalcon\Test\Unit\Dispatcher;

use UnitTester;

class GetModelBinderCest
{
    /**
     * Tests Phalcon\Dispatcher :: getModelBinder()
     *
     * @author Phalcon Team <team@phalcon.io>
     * @since  2018-11-13
     */
    public function dispatcherGetModelBinder(UnitTester $I)
    {
        $I->wantToTest('Dispatcher - getModelBinder()');

        $I->skipTest('Need implementation');
    }
}
