
/**
 * This file is part of the Phalcon Framework.
 *
 * (c) Phalcon Team <team@phalconphp.com>
 *
 * For the full copyright and license information, please view the LICENSE.txt
 * file that was distributed with this source code.
 */

namespace Phalcon\Validation\Validator\StringLength;

use Phalcon\Messages\Message;
use Phalcon\Validation;
use Phalcon\Validation\Validator;
use Phalcon\Validation\Exception;

/**
 * Phalcon\Validation\Validator\StringLength
 *
 * Validates that a string has the specified maximum constraints
 * The test is passed if for a string's length L, L<=max, i.e. L must
 * be at most max.
 *
 * <code>
 * use Phalcon\Validation;
 * use Phalcon\Validation\Validator\StringLength\Max;
 *
 * $validator = new Validation();
 *
 * $validation->add(
 *     "name_last",
 *     new Max(
 *         [
 *             "max"     => 50,
 *             "message" => "We don't like really long names",
 *         ]
 *     )
 * );
 *
 * $validation->add(
 *     [
 *         "name_last",
 *         "name_first",
 *     ],
 *     new Max(
 *         [
 *             "max" => [
 *                 "name_last"  => 50,
 *                 "name_first" => 40,
 *             ],
 *             "message" => [
 *                 "name_last"  => "We don't like really long last names",
 *                 "name_first" => "We don't like really long first names",
 *             ]
 *         ]
 *     )
 * );
 * </code>
 */
class Max extends Validator
{
    protected advice = "Field :field must not exceed :max characters long";

    /**
     * Executes the validation
     */
    public function validate(<Validation> validation, var field) -> bool
    {
        var value, length, maximum, label, replacePairs, code;

        let value = validation->getValue(field),
            label = this->prepareLabel(validation, field),
            code = this->prepareCode(field);

        // Check if mbstring is available to calculate the correct length
        if function_exists("mb_strlen") {
            let length = mb_strlen(value);
        } else {
            let length = strlen(value);
        }

        let maximum = this->getOption("max");

        if typeof maximum == "array" {
            let maximum = maximum[field];
        }

        if length > maximum {
            let replacePairs = [
                ":field": label,
                ":max":   maximum
            ];

            validation->appendMessage(
                new Message(
                    strtr(this->getAdvice(field), replacePairs),
                    field,
                    get_class(this),
                    code
                )
            );

            return false;
        }

        return true;
    }
}
