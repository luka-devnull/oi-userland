#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

#
# Copyright (c) 2013, 2014, Oracle and/or its affiliates. All rights reserved.
#

Puppet::Type.newtype(:address_properties) do
    @doc = "Manage Oracle Solaris address properties"

    ensurable do
        # remove the ability to specify :absent.  New values must be set.
        newvalue(:present) do
            provider.create
        end
    end

    newparam(:address) do
        desc "The name of the address object"
        isnamevar
    end

    newparam(:temporary) do
        desc "Optional parameter that specifies changes to the address object
              are temporary.  Changes last until the next reboot."
        newvalues(:true, :false)
    end

    newproperty(:properties) do
        desc "A hash table of propname=propvalue entries to apply to an
              address object"

        def property_matches?(current, desired)
            desired.each do |key, value|
                if current[key] != value
                    return :false
                end
            end
            return :true
        end
    end
end
