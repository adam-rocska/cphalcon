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

namespace Phalcon\Test\Unit\Crypt;

use UnitTester;

class GetAuthTagCest
{
    /**
     * Unit Tests Phalcon\Crypt :: getAuthTag()
     *
     * @author Phalcon Team <team@phalcon.io>
     * @since  2019-05-25
     */
    public function cryptGetAuthTag(UnitTester $I)
    {
        $I->wantToTest('Crypt - getAuthTag()');

        $I->skipTest('Need implementation');
    }
}
