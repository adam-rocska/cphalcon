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

namespace Phalcon\Test\Unit\Annotations\Adapter\Memory;

use UnitTester;

class GetMethodsCest
{
    /**
     * Tests Phalcon\Annotations\Adapter\Memory :: getMethods()
     *
     * @author Phalcon Team <team@phalcon.io>
     * @since  2018-11-13
     */
    public function annotationsAdapterMemoryGetMethods(UnitTester $I)
    {
        $I->wantToTest('Annotations\Adapter\Memory - getMethods()');

        $I->skipTest('Need implementation');
    }
}
