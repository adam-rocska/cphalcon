
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
 * Validates that a string has the specified minimum constraints
 * The test is passed if for a string's length L, min<=L, i.e. L must
 * be at least min.
 *
 * <code>
 * use Phalcon\Validation;
 * use Phalcon\Validation\Validator\StringLength\Min;
 *
 * $validator = new Validation();
 *
 * $validation->add(
 *     "name_last",
 *     new Min(
 *         [
 *             "min"     => 2,
 *             "message" => "We want more than just their initials",
 *         ]
 *     )
 * );
 *
 * $validation->add(
 *     [
 *         "name_last",
 *         "name_first",
 *     ],
 *     new Min(
 *         [
 *             "min" => [
 *                 "name_last"  => 2,
 *                 "name_first" => 4,
 *             ],
 *             "message" => [
 *                 "name_last"  => "We don't like too short last names",
 *                 "name_first" => "We don't like too short first names",
 *             ]
 *         ]
 *     )
 * );
 * </code>
 */
class Min extends Validator
{
    protected advice = "Field :field must be at least :min characters long";

    /**
     * Executes the validation
     */
    public function validate(<Validation> validation, var field) -> bool
    {
        var value, length, minimum, label, replacePairs, code;

        let value = validation->getValue(field),
            label = this->prepareLabel(validation, field),
            code = this->prepareCode(field);

        // Check if mbstring is available to calculate the correct length
        if function_exists("mb_strlen") {
            let length = mb_strlen(value);
        } else {
            let length = strlen(value);
        }

        let minimum = this->getOption("min");

        if typeof minimum == "array" {
            let minimum = minimum[field];
        }

        if length < minimum {
            let replacePairs = [
                ":field": label,
                ":min":   minimum
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
