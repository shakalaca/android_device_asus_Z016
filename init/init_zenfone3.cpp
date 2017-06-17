/*
   Copyright (c) 2014, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void vendor_load_properties()
{
    int prj_id = 246;
    FILE *fp;

    fp = fopen("/sys/devices/soc0/soc_id", "r");
    fscanf(fp, "%d", &prj_id);
    fclose(fp);
    
    property_set("ro.build.product", "ZS570KL");
    property_set("ro.product.model", "ASUS_Z016D");
    property_set("ro.product.name", "WW_Z016");
    property_set("ro.build.description", "zs570kl-user 7.0 NRD90M WW_user_5.14.44.2212_20170424 release-keys");
    if (prj_id == 246) { // S820
        property_set("ro.build.fingerprint", "asus/WW_Z016/Z016:7.0/NRD90M/WW_user_5.14.44.2212_20170424:user/release-keys");
        property_set("ro.product.device", "Z016");
        property_set("ro.product.carrier", "US-ASUS_Z016D-WW_Z016D");
        property_set("ro.build.csc.version", "WW_ZS570KL_5.14.44.2212_20170424");
    } else { // 305, S821
        property_set("ro.build.fingerprint", "asus/WW_Z016/Z016_1:7.0/NRD90M/WW_user_5.14.44.2212_20170424:user/release-keys");
        property_set("ro.product.device", "Z016_1");
        property_set("ro.product.carrier", "US-ASUS_Z016PRO-WW_Z016D");
        property_set("ro.build.csc.version", "WW_ZS570KLPRO_5.14.44.2212_20170424");
    }
}
