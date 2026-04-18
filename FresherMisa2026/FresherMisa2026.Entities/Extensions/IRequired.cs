using System;
using System.Collections.Generic;
using System.Text;

namespace FresherMisa2026.Entities.Extensions
{
    public class IRequired : Attribute
    {
        public string ErrorMessage { get; set; }

        public IRequired() { }

        public IRequired(string errorMessage)
        {
            ErrorMessage = errorMessage;
        }
    }
}
