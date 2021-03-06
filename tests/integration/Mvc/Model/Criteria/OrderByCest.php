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

namespace Phalcon\Test\Integration\Mvc\Model\Criteria;

use IntegrationTester;

/**
 * Class OrderByCest
 */
class OrderByCest
{
    /**
     * Tests Phalcon\Mvc\Model\Criteria :: orderBy()
     *
     * @author Phalcon Team <team@phalcon.io>
     * @since  2018-11-13
     */
    public function mvcModelCriteriaOrderBy(IntegrationTester $I)
    {
        $I->wantToTest('Mvc\Model\Criteria - orderBy()');
        $I->skipTest('Need implementation');
    }
}
