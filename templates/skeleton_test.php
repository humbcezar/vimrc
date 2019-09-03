<?php

namespace [:VIM_EVAL:]substitute(substitute(expand('%:h:@'), '\(\<\w\+\>\)', '\u\1', 'g'), "\/", "\\", "g")[:END_EVAL:];

use Tests\TestCase;

public class [:VIM_EVAL:]expand("%:t:r")[:END_EVAL:] extends TestCase {

}
