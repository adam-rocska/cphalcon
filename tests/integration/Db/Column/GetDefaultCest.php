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

namespace Phalcon\Test\Integration\Db\Column;

use IntegrationTester;
use Phalcon\Test\Fixtures\Traits\Db\MysqlTrait;
use Phalcon\Test\Fixtures\Traits\DiTrait;

class GetDefaultCest
{
    use DiTrait;
    use MysqlTrait;

    /**
     * Tests Phalcon\Db\Column :: getDefault()
     *
     * @author Phalcon Team <team@phalcon.io>
     * @since  2018-11-13
     */
    public function dbColumnGetDefault(IntegrationTester $I)
    {
        $I->wantToTest("Db\Column - getDefault()");

        $columns         = $this->getColumns();
        $expectedColumns = $this->getExpectedColumns();

        foreach ($expectedColumns as $index => $column) {
            $I->assertEquals(
                $columns[$index]['default'],
                $column->getDefault()
            );
        }
    }
}
